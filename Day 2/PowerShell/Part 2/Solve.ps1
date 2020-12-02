$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
$pwds = @()
$goodpwds = @()
foreach ($item in $list) {
    $split = $item -split "-" -split ":\s" -split "\s"
    $pwds += [PSCustomObject]@{
        Index1 = $split[0]-1
        Index2 = $split[1]-1
        Letter = $split[2]
        Password = $split[3]
    }
}

foreach ($pwd in $pwds) {
    if ($pwd.Password[$pwd.Index1] -eq $pwd.Letter -or $pwd.Password[$pwd.Index2] -eq $pwd.Letter) {
        if (!($pwd.Password[$pwd.Index1] -eq $pwd.Letter -and $pwd.Password[$pwd.Index2] -eq $pwd.Letter)) {
            $goodpwds += $pwd
        }
    }
}
$goodpwds.Count