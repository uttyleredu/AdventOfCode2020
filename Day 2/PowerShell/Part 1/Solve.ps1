$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
$pwds = @()
$goodpwds = @()
foreach ($item in $list) {
    $split = $item -split "-" -split ":\s" -split "\s"
    $pwds += [PSCustomObject]@{
        Min = $split[0]
        Max = $split[1]
        Letter = $split[2]
        Password = $split[3]
    }
}

foreach ($pwd in $pwds) {
    $result = $pwd.Password | Select-String $pwd.Letter -AllMatches
    $count = $result.Matches.Length
    if ($count -ge $pwd.Min -and $count -le $pwd.Max) {
        $goodpwds += $pwd
    }
}
$goodpwds.Count