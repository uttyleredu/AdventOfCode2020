$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
. $root\..\Functions\Solve-Day1.ps1 $list
