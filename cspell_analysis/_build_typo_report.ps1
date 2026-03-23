$ErrorActionPreference = "Stop"
$lines = Get-Content "$PSScriptRoot\..\api_names.txt"

# word → replacement-fragment mapping (based on dictionary comments)
# Case-sensitive so ACRMS and acrms are distinct keys
$wordFix = [System.Collections.Hashtable]::new([System.StringComparer]::Ordinal)
# Typos
$wordFix["ATTENTUATION"]  = "ATTENUATION"
$wordFix["CERTITICATES"]  = "CERTIFICATES"
$wordFix["POSSSIBLE"]     = "POSSIBLE"
$wordFix["SENSITIVIT"]    = "SENSITIVITY"
$wordFix["SUBSYTEM"]      = "SUBSYSTEM"
# INVALIDC handled separately below (INVALIDC_DAQ_ → INVALID_CDAQ_)
# Unseparated — uppercase
$wordFix["AHIGH"]         = "A_HIGH"
$wordFix["ALOW"]          = "A_LOW"
$wordFix["ACRMS"]         = "AC_RMS"
$wordFix["AOHW"]          = "AO_HW"
$wordFix["BHIGH"]         = "B_HIGH"
$wordFix["BLOW"]          = "B_LOW"
$wordFix["CAPI"]          = "C_API"
$wordFix["CIHW"]          = "CI_HW"
$wordFix["COHW"]          = "CO_HW"
$wordFix["COHWTSP"]       = "CO_HW_TIMED_SINGLE_POINT"   # HWTSP → HW_TIMED_SINGLE_POINT per HWTSP section
$wordFix["MIOAI"]         = "MIO_AI"
$wordFix["MULTIDEVICE"]   = "MULTI_DEVICE"
$wordFix["NONBUFFERED"]   = "NON_BUFFERED"
$wordFix["NOTKNOWN"]      = "NOT_KNOWN"
$wordFix["SCANLIST"]      = "SCAN_LIST"
$wordFix["TIMETRIGGERS"]  = "TIME_TRIGGERS"
$wordFix["USBDAQ"]        = "USB_DAQ"
# Unseparated — lowercase
$wordFix["acrms"]         = "ac_rms"
$wordFix["hwteds"]        = "hw_teds"

# cspell output: line number → list of flagged words
$lineWords = @{}
$flaggedPairs = @(
    @{Line=218;  Word="MIOAI"},      @{Line=451;  Word="AHIGH"},
    @{Line=451;  Word="BHIGH"},      @{Line=452;  Word="AHIGH"},
    @{Line=452;  Word="BLOW"},       @{Line=453;  Word="ALOW"},
    @{Line=453;  Word="BHIGH"},      @{Line=454;  Word="ALOW"},
    @{Line=454;  Word="BLOW"},      @{Line=540;  Word="MIOAI"},
    @{Line=541;  Word="MIOAI"},      @{Line=542;  Word="MIOAI"},
    @{Line=543;  Word="MIOAI"},      @{Line=544;  Word="MIOAI"},
    @{Line=545;  Word="MIOAI"},      @{Line=600;  Word="USBDAQ"},
    @{Line=824;  Word="ACRMS"},      @{Line=845;  Word="ACRMS"},
    @{Line=912;  Word="SCANLIST"},   @{Line=1113; Word="CAPI"},
    @{Line=1114; Word="CAPI"},       @{Line=1115; Word="CAPI"},
    @{Line=1116; Word="CAPI"},       @{Line=1117; Word="CAPI"},
    @{Line=1118; Word="CAPI"},       @{Line=1119; Word="CAPI"},
    @{Line=1120; Word="CAPI"},       @{Line=1121; Word="CAPI"},
    @{Line=1122; Word="CAPI"},       @{Line=1180; Word="CIHW"},
    @{Line=1220; Word="SCANLIST"},   @{Line=1375; Word="SCANLIST"},
    @{Line=1426; Word="TIMETRIGGERS"},@{Line=1453; Word="NOTKNOWN"},
    @{Line=1471; Word="POSSSIBLE"},  @{Line=1613; Word="ATTENTUATION"},
    @{Line=1713; Word="SCANLIST"},   @{Line=1743; Word="COHWTSP"},
    @{Line=1765; Word="INVALIDC"},   @{Line=1817; Word="SENSITIVIT"},
    @{Line=1869; Word="MULTIDEVICE"},@{Line=1876; Word="SUBSYTEM"},
    @{Line=1951; Word="NONBUFFERED"},@{Line=1952; Word="NONBUFFERED"},
    @{Line=1975; Word="CERTITICATES"},@{Line=2399; Word="SCANLIST"},
    @{Line=2434; Word="COHW"},       @{Line=2469; Word="SCANLIST"},
    @{Line=2551; Word="AOHW"},       @{Line=2572; Word="SCANLIST"},
    @{Line=2668; Word="CAPI"},       @{Line=3289; Word="acrms"},
    @{Line=3423; Word="acrms"},      @{Line=5364; Word="hwteds"}
)

foreach ($p in $flaggedPairs) {
    if (-not $lineWords.ContainsKey($p.Line)) { $lineWords[$p.Line] = [System.Collections.Generic.List[string]]::new() }
    if ($lineWords[$p.Line] -notcontains $p.Word) { $lineWords[$p.Line].Add($p.Word) }
}

# Build rows: one per unique symbol, applying ALL fixes for that symbol
$seen = @{}
$rows = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($lineNum in ($lineWords.Keys | Sort-Object)) {
    $raw = $lines[$lineNum - 1].Trim()
    $sym = $raw -replace '\(.*$', ''   # strip params

    if ($seen.ContainsKey($sym)) { continue }
    $seen[$sym] = $true

    # Apply every fix for this line's flagged words
    $fixed = $sym
    foreach ($w in $lineWords[$lineNum]) {
        if ($w -eq "INVALIDC") {
            # Special case: INVALIDC_DAQ → INVALID_CDAQ
            $fixed = $fixed -replace 'INVALIDC_DAQ', 'INVALID_CDAQ'
        } elseif ($wordFix.ContainsKey($w)) {
            $fixed = $fixed -replace [regex]::Escape($w), $wordFix[$w]
        }
    }
    # Post-processing: normalize remaining unapproved PT/SGL_PT shortenings for
    # "Single Point" — consistent with the HWTSP section decision.
    $fixed = $fixed -replace '_TIMED_SGL_PT\b', '_TIMED_SINGLE_POINT'
    $fixed = $fixed -replace '_TIMED_SINGLE_PT\b', '_TIMED_SINGLE_POINT'

    $rows.Add([PSCustomObject]@{
        SymbolToDeprecate = $sym
        ReplacedWith      = $fixed
    })
}

$rows = $rows | Sort-Object SymbolToDeprecate

# Build markdown
$outPath = "$PSScriptRoot\typo_rename_report.md"
$md = [System.Text.StringBuilder]::new()
$null = $md.AppendLine("# Typo and Unseparated API Name Rename Report")
$null = $md.AppendLine("")
$null = $md.AppendLine("Symbols flagged by cspell when the typo/unseparated entries are removed from the word")
$null = $md.AppendLine("list (`daqmx-python-api-elements-other-than-typos-and-unseparated.txt`).")
$null = $md.AppendLine("Each symbol below should be deprecated and replaced with the corrected form.")
$null = $md.AppendLine("")
$null = $md.AppendLine("| Symbol to Deprecate | Replace with |")
$null = $md.AppendLine("|---|---|")
foreach ($r in $rows) {
    $null = $md.AppendLine("| ``$($r.SymbolToDeprecate)`` | ``$($r.ReplacedWith)`` |")
}
$null = $md.AppendLine("")
$null = $md.AppendLine("**Total: $($rows.Count) symbols to rename**")

$md.ToString() | Set-Content $outPath -Encoding UTF8
Write-Host "Written $($rows.Count) rows to $outPath"
