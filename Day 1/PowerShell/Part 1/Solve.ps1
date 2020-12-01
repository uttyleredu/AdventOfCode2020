$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
$result = . $root\..\Functions\Solve-Day1.ps1 $list
$result