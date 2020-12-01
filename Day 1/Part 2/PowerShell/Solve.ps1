$root = $PSScriptRoot
$list = Get-Content $root\..\..\input.txt
foreach ($num1 in $list){
    $num1 = [int]$num1
    foreach ($num2 in $list){
        $num2 = [int]$num2
        foreach ($num3 in $list) {
            $num3 = [int]$num3
            $sum=$num1+$num2+$num3
            if ($sum -eq 2020){
                Write-Host First number: $num1
                Write-Host Second number: $num2
                Write-Host Third number: $num3
                Write-Host Product: $($num1*$num2*$num3)
                return
            }
        }
        
    }
}