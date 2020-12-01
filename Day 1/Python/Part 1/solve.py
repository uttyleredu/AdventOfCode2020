from pathlib import Path

path = Path(__file__).parent / "../../input.txt"
with path.open() as f:
    nums = f.readlines()

for q in range(0,len(nums)-1):
    nums[q] = nums[q].replace("\n","")

found = 0
for x in range(0,len(nums)-1):
    if found == 1:
        break
    for y in range(x,len(nums)-1):
        if (int(nums[x]) + int(nums[y]) == 2020):
                found = 1
                ans = [nums[x],nums[y]]
                break

print(int(ans[0]) * int(ans[1]))
     