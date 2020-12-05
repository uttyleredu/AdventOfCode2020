$root = $PSScriptRoot
$list = Get-Content $root\input.txt

[int] $high = 0
$chart = new-object bool[] 1024

#fill in the seating chart
foreach ($seat in $list) {
  $seat = $seat -replace "F|L","0" -replace "B|R","1"
  [int]$seatid=[Convert]::ToInt32($seat,2)  

  $chart[$seatid]=$true  
  if ($seatid -gt $high) {$high=$seatid} 
}

# Part One
write-host("Highest SeatID: {0}" -f $high)

# Part Two
#check for open seat with someone on each side
foreach($i in 0..$chart.Length){ 
  if ($chart[$i] -eq $false){ 
    if ($chart[$i-1] -and $chart[$i+1]) {
      write-host ("My SeatID:{0}" -f $i)
      }
   }  
}

#Credit: https://www.reddit.com/r/adventofcode/comments/k71h6r/2020_day_05_solutions/geq18pn?utm_source=share&utm_medium=web2x&context=3