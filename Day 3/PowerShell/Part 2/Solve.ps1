$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
$slopes = @(@(1,1),@(3,1),@(5,1),@(7,1),@(1,2))
$slopeTrees = @()
$answer = 0
foreach ($slope in $slopes) {
    $x = 0
    $trees = 0
    for ($y = 0; $y -lt $list.Count; $y += $slope[1]) {
        if ($x -gt 30) {
            $x = $x-31
        }
        if ($list[$y][$x] -eq "#") {
            $trees++
        }
        $x += $slope[0]
    }
    $slopeTrees += $trees
}
foreach ($trees in $slopeTrees) {
    if ($answer -eq 0) {
        $answer = $trees
    } else {
        $answer = $trees * $answer
    }
}
$answer