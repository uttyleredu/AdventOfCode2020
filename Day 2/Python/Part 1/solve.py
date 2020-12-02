from pathlib import Path

path = Path(__file__).parent / "../../input.txt"
with path.open() as f:
    pws = f.readlines()

countValid = 0
#for q in range(0,len(pws)):
for policy in pws:
    pwInfo = policy.split()
    policyAmts = pwInfo[0].split("-")
    policyMin = int(policyAmts[0])
    policyMax = int(policyAmts[1])
    policyLetter = pwInfo[1][0]
    pw = pwInfo[2]

    pwLetterCount = pw.count(policyLetter)
    if pwLetterCount >= policyMin and pwLetterCount <= policyMax:
        countValid += 1

print(countValid)