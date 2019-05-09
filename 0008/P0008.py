from functools import reduce
from operator import mul

def count(numbers, k):
  max_product = 0
  for i in range(len(numbers) - k):
    product = reduce(mul, [ numbers[i] for i in range(i, i + k)])
    max_product = max(max_product, product)
  return max_product

if __name__ == "__main__":
  t = int(input())
  for i in range(t):
    n, k = map(int, input().split())
    numbers = list(map(int, list(input())))
    result = count(numbers, k)
    print(int(result))