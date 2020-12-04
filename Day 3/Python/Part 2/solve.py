from pathlib import Path

def TraverseSlope(xAmt, yAmt, input):
    xLoc = 0
    cntTrees = 0
    for yLoc in range(yAmt,len(input),yAmt):
        line = input[yLoc].replace("\n","")
        xLoc = xLoc+xAmt
        #determine if past end of input line, if yes, go back to beginning of line
        if (xLoc) > len(line)-1:
            xLoc = xLoc-len(line)
        
        #determine if tree in spot
        if (line[xLoc] == "#"):
            cntTrees += 1
    return cntTrees

path = Path(__file__).parent / "../../input.txt"

with path.open() as f:
    lines = f.readlines()

multTrees = 1
multTrees *= TraverseSlope(1,1,lines)
multTrees *= TraverseSlope(3,1,lines)
multTrees *= TraverseSlope(5,1,lines)
multTrees *= TraverseSlope(7,1,lines)
multTrees *= TraverseSlope(1,2,lines)
print(multTrees)
