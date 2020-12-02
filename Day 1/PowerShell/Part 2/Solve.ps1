$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
foreach ($num in $list){
    $num = [int]$num
    $result = . $root\..\Functions\Solve-Day1.ps1 $list $(2020-$num)
    if ($result) {
        $result
        break
    }
}