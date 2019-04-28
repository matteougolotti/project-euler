
def natural_sum(x):
    return x * (x + 1) // 2

def count(n):
    n = n - 1
    return 3 * natural_sum(n // 3) + 5 * natural_sum(n // 5) - 15 * natural_sum(n // 15)

if __name__ == "__main__":
  t = int(input())
  for i in range(t):
    n = int(input())
    result = count(n)
    print(str(result))