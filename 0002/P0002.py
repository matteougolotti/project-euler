import sys

def fibs(n : int) -> int:
    a = 0
    b = 1
    numbers = []
    while((a + b) <= n):
        c = a + b
        numbers.append(c)
        a = b
        b = c
    return numbers

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    s = sum([ x for x in fibs(n) if x % 2 == 0 ])
    print(s)