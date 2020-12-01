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
        if found == 1:
            break
        for z in range(y,len(nums)-1):
            if (int(nums[x]) + int(nums[y]) + int(nums[z]) == 2020):
                found = 1
                ans = [nums[x],nums[y],nums[z]]
                break

print(int(ans[0]) * int(ans[1]) * int(ans[2]))
     
