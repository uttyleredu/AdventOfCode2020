from pathlib import Path
import string

ecl_values = ["amb","blu", "brn","gry","grn","hzl","oth"]

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
        if (attr == "byr"):
            if value.isnumeric():
                if (int(value) < 1920) or (int(value) > 2002):
                    return False
            else:
                return False
        elif (attr == "iyr"):
            if value.isnumeric():
                if (int(value) < 2010) or (int(value) > 2020):
                    return False
            else:
                return False
        elif (attr == "eyr"):
            if value.isnumeric():
                if (int(value) < 2020) or (int(value) > 2030):
                    return False
            else:
                return False
        elif (attr == "hgt"):
            if value[0:-2].isnumeric():
                if (value.endswith("cm")):
                    if (int(value[0:-2]) < 150) or (int(value[0:-2]) > 193):
                        return False
                elif (value.endswith("in")):
                    if (int(value[0:-2])  < 59) or (int(value[0:-2]) > 76):
                        return False
                else:
                    return False
            else:
                return False
        elif (attr == "hcl"):
            if (value.startswith("#") or (len(value) == 7)):
                for item in value[1:]:
                    if not (all(x in string.hexdigits for x in item)):
                        return False
            else:
                return False
        elif (attr == "ecl"):
            if not (value in ecl_values):
                return False
        elif(attr == "pid"):
            if (not value.isnumeric) or (len(value) != 9):
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