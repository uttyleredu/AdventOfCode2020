[CmdletBinding()]
param (
    [Parameter(Mandatory=$True)]
    [int[]]$List,
    [int]$Target=2020
)

begin {
    
}

process {
    foreach ($num in $List){
        $num = [int]$num
        $dif = ($Target-$num)
        if ($list -contains $dif)
        {
            if ($Target -eq 2020) {
                $product = $num*$dif
            } else {
                $product = (2020-$Target)*$num*$dif
            }
            return $product
        }
    }
}

end {
    
}