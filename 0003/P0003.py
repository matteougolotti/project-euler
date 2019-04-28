import math

def largest_prime_factor(n):
  prime_factors = list()
  for i in range(2, int(math.sqrt(n)) + 1):
    while n % i == 0:
      n = n / i
      prime_factors.append(i)
  if n > 2:
    prime_factors.append(int(n))
  return max(prime_factors)

if __name__ == "__main__":
  t = int(input())
  for i in range(t):
    n = int(input())
    gpf = largest_prime_factor(n)
    print(gpf)