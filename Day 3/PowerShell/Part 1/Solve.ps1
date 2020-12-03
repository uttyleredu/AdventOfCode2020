$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
$x = 0
$trees = 0
foreach ($row in $list) {
    if ($x -gt 30) {
        $x = $x-31
    }
    if ($row[$x] -eq "#") {
        $trees++
    }
    $x += 3
}
$trees