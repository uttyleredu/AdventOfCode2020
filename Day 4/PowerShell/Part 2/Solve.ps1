$root = $PSScriptRoot
$passports = (Get-Content $root\..\..\input.txt -Raw).Split(@("`r`n`r`n","`n`n"),0) -replace "`r`n"," " -replace "`n"," "
$validpassports = @()
$requiredfields = @("byr","iyr","eyr","hgt","hcl","ecl","pid")
$eyecolors = @("amb","blu","brn","gry","grn","hzl","oth")
foreach ($passport in $passports) {
    $fields = $passport -replace ":","=" -replace "\s+","`n" | ConvertFrom-StringData
    if (Compare-Object ($fields.Keys -split "`n") $requiredfields | ? SideIndicator -eq "=>") {continue}
    if ($fields["byr"] -lt 1920 -or $fields["byr"] -gt 2002) {continue}
    if ($fields["iyr"] -lt 2010 -or $fields["iyr"] -gt 2020) {continue}
    if ($fields["eyr"] -lt 2020 -or $fields["eyr"] -gt 2030) {continue}
    if ($fields["hgt"] -notmatch "cm" -and $fields["hgt"] -notmatch "in") {continue}
    $height = $fields["hgt"] -replace "in|cm",""
    $hsys = $fields["hgt"] -replace "\d",""
    if ($hsys -eq "in" -and ($height -lt 59 -or $height -gt 76)) {continue}
    if ($hsys -eq "cm" -and ($height -lt 150 -or $height -gt 193)) {continue}
    if ($fields["hcl"] -notmatch "#[0-9|a-f]{6}") {continue}
    if ($eyecolors -notcontains $fields["ecl"]) {continue}
    if ($fields["pid"].Length -lt 9 -or $fields["pid"].Length -gt 9) {continue}
    $validpassports += $passport
}
$validpassports.Count