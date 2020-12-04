$root = $PSScriptRoot
$passports = (Get-Content $root\..\..\input.txt -Raw).Split(@("`r`n`r`n","`n`n"),0) -replace "`r`n"," " -replace "`n"," "
$validpassports = @()
$requiredfields = @("byr","iyr","eyr","hgt","hcl","ecl","pid")
foreach ($passport in $passports) {
    $fields = $passport -replace ":","=" -replace "\s+","`n" | ConvertFrom-StringData
    if (!(Compare-Object ($fields.Keys -split "`n") $requiredfields | ? SideIndicator -eq "=>")) {
        $validpassports += $passport
    }
}
$validpassports.Count