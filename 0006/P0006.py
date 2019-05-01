import sys

def natural_square_sum(n):
  return n * (n + 1) * (2 * n + 1) / 6

def natural_sum_square(n):
  return (n * (n + 1) / 2) ** 2

if __name__ == "__main__":
  t = int(input())
  for i in range(t):
    n = int(input())
    result = natural_sum_square(n) - natural_square_sum(n)
    print(str(int(result)))