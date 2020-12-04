from pathlib import Path

cntTrees = 0
path = Path(__file__).parent / "../../input.txt"

with path.open() as f:
    line = f.readline()
    line = f.readline()
    line = line.replace("\n","")
    xLoc = 0
    while (line):
        xLoc = xLoc+3
        #determine if past end of input line, if yes, go back to beginning of line
        if (xLoc) > len(line)-1:
            xLoc = xLoc-len(line)
        #determine if tree in spot
        if (line[xLoc] == "#"):
            cntTrees += 1
        line = f.readline()
        line = line.replace("\n","")

print(cntTrees)