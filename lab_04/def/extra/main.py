"""
Выводит заведомо выигрышные и прогрышные позиции в игре
"""

n = int(input("Enter n: "))
k = int(input("Enter k: "))

print(f"n = {n}; k = {k}")

arr = [False] * (n + 1)

arr[0] = True

for i in range(1, len(arr)):
    if i - k >= 0:
        arr[i] = not arr[i - 1] or not arr[i - k]
    else:
        arr[i] = not arr[i - 1]

for i, v in enumerate(arr):
    if v:
        print(f"{i}\t+")
    else:
        print(f"{i}\t-")

print()
