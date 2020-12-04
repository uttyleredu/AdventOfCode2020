from pathlib import Path

class Passenger:
    def __init__(self, byr,iyr,eyr,hgt,hcl,ecl,pid,cid):
        self.byr = byr
        self.iyr = iyr
        self.eyr = eyr
        self.hgt = hgt
        self.hcl = hcl
        self.ecl = ecl
        self.pid = pid
        self.cid = cid

def parseRecord(record):
    person = Passenger("","","","","","","","")
    info = record.split()
    for item in info:
        recs = item.split(":")
        setattr(person,recs[0],recs[1])
    return(person)

def determineIfValid(person):
    for attr, value in person.__dict__.items():
        if (value != ""):
            pass
        else:
            if (attr != "cid"):
                return False
    return True

path = Path(__file__).parent / "../../input.txt"

countValids = 0
with path.open("rt") as f:
    line = True
    while (line):
        foundEntireRecord = False
        rec = ""
        while not foundEntireRecord:
            line = f.readline()
            if ((line != "\n") and (line != '')):
                rec += line
            else:
                foundEntireRecord = True
                person = parseRecord(rec)
                if(determineIfValid(person)):
                    countValids += 1

print(countValids)