from math import sqrt

def count(n):
  result = -1
  for a in range(1, int(n / 3)):
    a2 = a ** 2
    c = (-2 * a2 + ((a * n) * 2) - n ** 2) / ((a - n) * 2)
    c2 = c ** 2
    b = sqrt(c2 - a2)
    b2 = b ** 2
    if a2 + b2 == c2 and (a + b + c == n) and b.is_integer() and b > 0 and c.is_integer() and c > 0:
      result = max(a * b * c, result)
  return int(result)

if __name__ == '__main__':
  t = int(input())
  for i in range(t):
    n = int(input())
    result = count(n)
    print(result)
