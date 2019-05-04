from math import sqrt

def is_prime(n, primes):
  s = int(sqrt(n))
  for prime in primes:
    if n % prime == 0:
      return False
    if prime >= s:
      return True
  return True

def prime(n, primes):
  next_prime = primes[-1] + 2
  while len(primes) <= n:
    if is_prime(next_prime, primes):
      primes.append(next_prime)
    next_prime += 2
  return primes[n - 1]

if __name__ == "__main__":
  primes = [2, 3]
  t = int(input())
  for i in range(t):
    n = int(input())
    result = prime(n, primes)
    print(result)