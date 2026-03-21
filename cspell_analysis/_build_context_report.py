"""
Build api_names_context_report.md from api_names_cspell_report.txt and api_names.txt.

Run this *after* generating api_names_cspell_report.txt with cspell using the
daqmx-python-api-elements-with-comments dictionary override on api_names.txt.
"""

import re
from collections import defaultdict
from pathlib import Path

HERE = Path(__file__).parent
ROOT = HERE.parent

CSPELL_REPORT = HERE / "api_names_cspell_report.txt"
API_NAMES = ROOT / "api_names.txt"
OUT_MD = HERE / "api_names_context_report.md"

# ── read cspell report (may be UTF-16 from PowerShell Tee-Object) ─────────────

def read_text_any_encoding(path: Path) -> str:
    for enc in ("utf-16", "utf-8-sig", "utf-8"):
        try:
            return path.read_text(encoding=enc)
        except (UnicodeDecodeError, UnicodeError):
            continue
    return path.read_text(encoding="latin-1")


raw = read_text_any_encoding(CSPELL_REPORT)

# cspell output line format:
#   /abs/path/api_names.txt:LINE:COL - Unknown word (WORD)
#   api_names.txt:LINE:COL - Unknown word (WORD)
ISSUE_RE = re.compile(r":(\d+):\d+ - Unknown word \((\S+)\)")

# word -> set of 1-based line numbers
word_lines: dict[str, set[int]] = defaultdict(set)

for line in raw.splitlines():
    m = ISSUE_RE.search(line)
    if m:
        lineno = int(m.group(1))
        word = m.group(2)
        word_lines[word].add(lineno)

if not word_lines:
    print("No issues found in cspell report. Nothing to write.")
    raise SystemExit(0)

# ── read api_names.txt lines (1-indexed) ─────────────────────────────────────

api_lines = API_NAMES.read_text(encoding="utf-8").splitlines()

def get_line(n: int) -> str:
    """Return the source line at 1-based line number n (empty string if OOB)."""
    idx = n - 1
    if 0 <= idx < len(api_lines):
        return api_lines[idx]
    return ""

# ── build markdown ────────────────────────────────────────────────────────────

md_lines: list[str] = []
md_lines.append("# api_names.txt — cspell context report\n")
md_lines.append(
    f"{len(word_lines)} distinct flagged words · "
    f"{sum(len(v) for v in word_lines.values())} total issues\n"
)

for word in sorted(word_lines, key=str.lower):
    linenos = sorted(word_lines[word])
    # Deduplicate by content so we don't repeat the same API name segment
    seen_content: set[str] = set()
    unique_rows: list[tuple[int, str]] = []
    for n in linenos:
        content = get_line(n).strip()
        if content not in seen_content:
            seen_content.add(content)
            unique_rows.append((n, content))

    md_lines.append(f"## `{word}`\n")
    md_lines.append("| Line | Content |")
    md_lines.append("| ---: | ------- |")
    for n, content in unique_rows:
        link = f"[:{n}](../api_names.txt#L{n})"
        md_lines.append(f"| {link} | `{content}` |")
    md_lines.append("")

outdated comment

# ── load preserved "extra" content from existing file ────────────────────────
# Extra content = anything between the data table and the next ## heading.
# This preserves hand-written HTML recommendation tables.

preserved: dict[str, str] = {}
SECTION_RE = re.compile(r"^## `(.+?)`", re.MULTILINE)

if OUT_MD.exists():
    existing = OUT_MD.read_text(encoding="utf-8")
    section_starts = [(m.group(1), m.start()) for m in SECTION_RE.finditer(existing)]
    for i, (word, start) in enumerate(section_starts):
        end = section_starts[i + 1][1] if i + 1 < len(section_starts) else len(existing)
        section_text = existing[start:end]
        # Find end of the data table (last | row line)
        table_lines = [l for l in section_text.splitlines() if l.startswith("|")]
        if table_lines:
            last_table_line = table_lines[-1]
            # Find position after last table line
            table_end = section_text.rfind(last_table_line) + len(last_table_line)
            extra = section_text[table_end:].rstrip()
            if extra.strip():
                preserved[word] = extra

# ── build markdown ────────────────────────────────────────────────────────────

md_lines: list[str] = []
md_lines.append("# api_names.txt — cspell context report\n")
md_lines.append(
    f"{len(word_lines)} distinct flagged words · "
    f"{sum(len(v) for v in word_lines.values())} total issues\n"
)

for word in sorted(word_lines, key=str.lower):
    linenos = sorted(word_lines[word])
    # Deduplicate by content so we don't repeat the same API name segment
    seen_content: set[str] = set()
    unique_rows: list[tuple[int, str]] = []
    for n in linenos:
        content = get_line(n).strip()
        if content not in seen_content:
            seen_content.add(content)
            unique_rows.append((n, content))

    md_lines.append(f"## `{word}`\n")
    md_lines.append("| Line | Content |")
    md_lines.append("| ---: | ------- |")
    for n, content in unique_rows:
        link = f"[:{n}](../api_names.txt#L{n})"
        md_lines.append(f"| {link} | `{content}` |")
    # Re-append any preserved extra content (e.g. hand-written HTML tables)
    if word in preserved:
        md_lines.append(preserved[word])
    md_lines.append("")

OUT_MD.write_text("\n".join(md_lines), encoding="utf-8")
print(f"Wrote {len(word_lines)} words to {OUT_MD}")
