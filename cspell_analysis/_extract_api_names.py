"""
Extracts all public API names from the generated nidaqmx package,
categorizes them, and writes a sorted report to api_names.txt.
"""

import ast
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).parent.parent
GENERATED = ROOT / "generated" / "nidaqmx"
DICT_PATH = ROOT / ".config" / "cspell" / "daqmx-api-elements.txt"

# ── load flagged fragments ─────────────────────────────────────────────────────

_FLAGGED_KEYWORDS = {"unseparated words", "unseparated initialisms", "typo"}

# Maps lowercase fragment -> short label (e.g. "unseparated initialisms")
_flagged: dict[str, str] = {}
for _line in DICT_PATH.read_text(encoding="utf-8").splitlines():
    _line = _line.strip()
    if not _line or "#" not in _line:
        continue
    _word, _comment = _line.split("#", 1)
    _word = _word.strip()
    _comment_lower = _comment.strip().lower()
    for _kw in _FLAGGED_KEYWORDS:
        if _comment_lower.startswith(_kw):
            _flagged[_word.lower()] = _kw
            break


def find_issues(name: str) -> list[str]:
    """Return sorted list of flagged fragment labels found in name.

    Only flags ALL_CAPS tokens — PascalCase names are readable as-is
    because case boundaries serve as word separators.
    """
    found = []
    # Work on the member portion (after last dot, or the whole name)
    member = name.rsplit(".", 1)[-1]
    for tok in member.split("_"):
        # Flag tokens that are ALL_CAPS or alllowercase — both lack visible
        # word boundaries. Mixed/PascalCase tokens are fine as-is.
        if not tok or not any(c.isalpha() for c in tok):
            continue
        if tok == tok.upper() or tok == tok.lower():
            if tok.lower() in _flagged:
                found.append(f"{tok} ({_flagged[tok.lower()]})")
    return sorted(found)


# ── helpers ────────────────────────────────────────────────────────────────────

def is_deprecated(func_node: ast.FunctionDef) -> bool:
    """Return True if the function has a @deprecation.deprecated(...) decorator."""
    for dec in func_node.decorator_list:
        if not isinstance(dec, ast.Call):
            continue
        func = dec.func
        if (
            (isinstance(func, ast.Attribute) and func.attr == "deprecated")
            or (isinstance(func, ast.Name) and func.id == "deprecated")
        ):
            return True
    return False


def rel(path: Path) -> str:
    full = str(path.relative_to(ROOT)).replace("\\", "/")
    prefix = "generated/nidaqmx/"
    return full[len(prefix):] if full.startswith(prefix) else full

def is_public(name: str) -> bool:
    return not name.startswith("_")

def parse(path: Path) -> ast.Module:
    return ast.parse(path.read_text(encoding="utf-8"))

def base_names(node: ast.ClassDef) -> list[str]:
    names = []
    for b in node.bases:
        if isinstance(b, ast.Name):
            names.append(b.id)
        elif isinstance(b, ast.Attribute):
            names.append(b.attr)
    return names

# ── extraction ─────────────────────────────────────────────────────────────────

# Each entry: (category, name, source_file)
records: list[tuple[str, str, str]] = []

def add(category: str, name: str, source: Path):
    records.append((category, name, rel(source)))


def process_constants(path: Path):
    tree = parse(path)
    for node in ast.walk(tree):
        if not isinstance(node, ast.ClassDef):
            continue
        bases = base_names(node)
        if any(b in ("IntEnum", "Enum") for b in bases):
            add("Enum type", node.name, path)
            for item in node.body:
                if isinstance(item, ast.Assign):
                    for t in item.targets:
                        if isinstance(t, ast.Name) and is_public(t.id):
                            add("Enum member", f"{node.name}.{t.id}", path)


def process_error_codes(path: Path):
    tree = parse(path)
    for node in ast.walk(tree):
        if not isinstance(node, ast.ClassDef):
            continue
        bases = base_names(node)
        if any(b in ("IntEnum", "Enum") for b in bases):
            category = "Error code" if "Error" in node.name else "Warning code"
            for item in node.body:
                if isinstance(item, ast.Assign):
                    for t in item.targets:
                        if isinstance(t, ast.Name) and is_public(t.id):
                            add(category, f"{node.name}.{t.id}", path)


def process_class_file(path: Path, class_category: str):
    """Extract public methods, properties, and method parameters from a class file."""
    tree = parse(path)
    for node in ast.walk(tree):
        if not isinstance(node, ast.ClassDef):
            continue
        if not is_public(node.name):
            continue
        class_name = node.name
        add("Class", class_name, path)
        for item in node.body:
            if not isinstance(item, ast.FunctionDef):
                continue
            if not is_public(item.name):
                continue
            if is_deprecated(item):
                continue
            # Determine if it's a property
            is_prop = any(
                (isinstance(d, ast.Name) and d.id == "property") or
                (isinstance(d, ast.Attribute) and d.attr in ("setter", "deleter", "getter"))
                for d in item.decorator_list
            )
            is_setter_or_deleter = any(
                isinstance(d, ast.Attribute) and d.attr in ("setter", "deleter")
                for d in item.decorator_list
            )
            if is_prop and not is_setter_or_deleter:
                add(f"{class_category} property", f"{class_name}.{item.name}", path)
            elif not is_prop:
                add(f"{class_category} method", f"{class_name}.{item.name}", path)
                # Extract keyword-passable parameters (skip self/cls, *args, **kwargs)
                args = item.args
                skip = {"self", "cls"}
                params = [
                    a.arg for a in (args.args + args.kwonlyargs)
                    if a.arg not in skip and is_public(a.arg)
                ]
                for param in params:
                    add(
                        f"{class_category} method parameter",
                        f"{class_name}.{item.name}({param})",
                        path,
                    )


def process_types_file(path: Path):
    """Extract namedtuple names/fields and any class members from types.py."""
    tree = parse(path)
    for node in ast.walk(tree):
        # collections.namedtuple("Name", ["field1", "field2", ...])
        if isinstance(node, ast.Assign):
            if not isinstance(node.value, ast.Call):
                continue
            call = node.value
            func = call.func
            is_namedtuple = (
                (isinstance(func, ast.Attribute) and func.attr == "namedtuple") or
                (isinstance(func, ast.Name) and func.id == "namedtuple")
            )
            if not is_namedtuple or len(call.args) < 2:
                continue
            # First arg is the type name string
            if not isinstance(call.args[0], ast.Constant):
                continue
            type_name = call.args[0].value
            add("Named tuple", type_name, path)
            # Second arg is the field list
            fields_arg = call.args[1]
            if isinstance(fields_arg, ast.List):
                for elt in fields_arg.elts:
                    if isinstance(elt, ast.Constant):
                        add("Named tuple field", f"{type_name}.{elt.value}", path)
            elif isinstance(fields_arg, ast.Constant):
                # space- or comma-separated string
                for field in fields_arg.value.replace(",", " ").split():
                    add("Named tuple field", f"{type_name}.{field}", path)
        # typing.NamedTuple subclass fields
        elif isinstance(node, ast.ClassDef):
            bases = base_names(node)
            if "NamedTuple" not in bases:
                continue
            add("Named tuple", node.name, path)
            for item in node.body:
                if isinstance(item, ast.AnnAssign) and isinstance(item.target, ast.Name):
                    add("Named tuple field", f"{node.name}.{item.target.id}", path)


# ── routing ────────────────────────────────────────────────────────────────────

SKIP_FILES = {
    "_base_interpreter.py",
    "_bitfield_utils.py",
    "_dotenvpath.py",
    "_dotenv_path.py",
    "_feature_toggles.py",
    "_grpc_interpreter.py",
    "_grpc_time.py",
    "_install_daqmx.py",
    "_lib.py",
    "_library_interpreter.py",
    "_lib_time.py",
    "_linux_installation_commands.py",
    "_time.py",
    "_waveform_utils.py",
    "__init__.py",
    "__main__.py",
}

SKIP_DIRS = {"_stubs", "__pycache__"}

# Class category mapping by subdirectory / filename pattern
def classify(path: Path) -> str:
    parts = {p for p in path.parts}
    name = path.name
    if "stream_readers" in parts:
        return "Stream reader"
    if "stream_writers" in parts:
        return "Stream writer"
    if "_collections" in parts or "collections" in parts:
        return "Collection"
    if "_watchdog_modules" in parts:
        return "Watchdog"
    if "triggering" in parts:
        return "Triggering"
    if "channels" in parts:
        return "Channel"
    if "storage" in parts:
        return "Storage"
    if "system" in parts:
        return "System"
    if "task" in parts:
        return "Task"
    # top-level files
    stem = path.stem.lstrip("_")
    return {
        "scale": "Scale",
        "errors": "Error class",
        "grpc_session_options": "gRPC",
        "utils": "Utility",
        "types": "Type",
    }.get(stem, "Misc")


for py in sorted(GENERATED.rglob("*.py")):
    # skip unwanted dirs
    if any(d in SKIP_DIRS for d in py.parts):
        continue
    if py.name in SKIP_FILES:
        continue

    if py.name == "constants.py":
        process_constants(py)
    elif py.name == "error_codes.py":
        process_error_codes(py)
    elif py.name == "types.py":
        process_types_file(py)
    else:
        process_class_file(py, classify(py))


# ── output ─────────────────────────────────────────────────────────────────────

CATEGORY_ORDER = [
    "Class",
    "Enum type",
    "Enum member",
    "Error code",
    "Warning code",
    "Named tuple",
    "Named tuple field",
    "Task method",
    "Task method parameter",
    "Task property",
    "Channel method",
    "Channel method parameter",
    "Channel property",
    "Collection method",
    "Collection method parameter",
    "Collection property",
    "Triggering method",
    "Triggering method parameter",
    "Triggering property",
    "Stream reader method",
    "Stream reader method parameter",
    "Stream reader property",
    "Stream writer method",
    "Stream writer method parameter",
    "Stream writer property",
    "System method",
    "System method parameter",
    "System property",
    "Watchdog method",
    "Watchdog method parameter",
    "Watchdog property",
    "Storage method",
    "Storage method parameter",
    "Storage property",
    "Scale method",
    "Scale method parameter",
    "Scale property",
    "gRPC method",
    "gRPC method parameter",
    "gRPC property",
    "Error class method",
    "Error class method parameter",
    "Error class property",
    "Utility method",
    "Utility method parameter",
    "Utility property",
    "Type method",
    "Type method parameter",
    "Type property",
    "Misc method",
    "Misc method parameter",
    "Misc property",
]

by_cat: dict[str, list[tuple[str, str]]] = defaultdict(list)
for cat, name, src in records:
    by_cat[cat].append((name, src))

# Sort names within each category
for cat in by_cat:
    by_cat[cat].sort(key=lambda x: x[0].lower())

col_width = max(len(name) for _, name, _ in records) + 1

# Pre-compute issues for all records
issues_map: dict[tuple[str, str], list[str]] = {}
for cat, name, src in records:
    issues_map[(name, src)] = find_issues(name)

output_lines: list[str] = []
seen_categories = set()
ordered = [c for c in CATEGORY_ORDER if c in by_cat]
# Append any categories not in the explicit order list
ordered += sorted(c for c in by_cat if c not in seen_categories and c not in ordered)

def group_by_file(entries: list[tuple[str, str]]) -> list[tuple[str, list[str]]]:
    """Return [(src, [name, ...]), ...] preserving sort order within each file."""
    file_order: list[str] = []
    by_file: dict[str, list[str]] = {}
    for name, src in entries:
        if src not in by_file:
            file_order.append(src)
            by_file[src] = []
        by_file[src].append(name)
    return [(src, by_file[src]) for src in file_order]

for cat in ordered:
    entries = by_cat.get(cat, [])
    if not entries:
        continue
    header = f"  {cat.upper()} ({len(entries)})"
    sep = "=" * (len(header) + 2)
    output_lines.append(sep)
    output_lines.append(header)
    output_lines.append(sep)
    for src, names in group_by_file(entries):
        output_lines.append(f"      [ {src} ]")   # column 7
        for name in names:
            output_lines.append(f"          {name}")  # column 11
    output_lines.append("")

total = sum(len(v) for v in by_cat.values())
output_lines.insert(0, f"nidaqmx Python API names  —  {total} entries  (file paths relative to generated/nidaqmx/)\n")

out_path = ROOT / "api_names.txt"
out_path.write_text("\n".join(output_lines), encoding="utf-8")
print(f"Wrote {total} entries to {out_path}")

# ── flagged-only report ───────────────────────────────────────────────────────
flagged_lines: list[str] = []
flagged_total = 0
for cat in ordered:
    entries = by_cat.get(cat, [])
    flagged_entries = [(name, src) for name, src in entries if issues_map[(name, src)]]
    if not flagged_entries:
        continue
    header = f"  {cat.upper()} ({len(flagged_entries)})"
    sep = "=" * (len(header) + 2)
    flagged_lines.append(sep)
    flagged_lines.append(header)
    flagged_lines.append(sep)
    for name, src in flagged_entries:
        issues = issues_map[(name, src)]
        annotation = "  " + ", ".join(issues)
        flagged_lines.append(f"* {name:<{col_width}}  {src}{annotation}")
    flagged_lines.append("")
    flagged_total += len(flagged_entries)

flagged_lines.insert(0, f"nidaqmx Python API names  —  flagged only  —  {flagged_total} entries  (file paths relative to generated/nidaqmx/)\n")

flagged_path = ROOT / "cspell_analysis" / "api_names_flagged.txt"
flagged_path.write_text("\n".join(flagged_lines), encoding="utf-8")
print(f"Wrote {flagged_total} flagged entries to {flagged_path}")
