import math

def get_primes(n):
  numbers = list(range(2, n + 1))
  primes = []
  while len(numbers) > 0:
    prime = numbers[0]
    primes.append(prime)
    numbers = list(filter(lambda x : x % prime != 0, numbers))
  return primes

def prime_factors(n, primes):
  factors = dict()
  for prime in list(filter(lambda x : x <= n, primes)):
    while n % prime == 0:
      n = n / prime
      if prime in factors:
        factors[prime] = factors[prime] + 1
      else:
        factors[prime] = 1
  return factors

def lcm(numbers):
  primes = get_primes(max(numbers))
  lcm = 1
  lcm_factors = dict()
  for n in numbers:
    factors = prime_factors(n, primes)
    for factor in factors:
      if factor in lcm_factors:
        lcm_factors[factor] = max(lcm_factors[factor], factors[factor])
      else:
        lcm_factors[factor] = 1
  for factor in lcm_factors:
    lcm = lcm * factor ** lcm_factors[factor]
  return lcm

if __name__ == "__main__":
  t = int(input())
  for i in range(t):
    n = int(input())
    result = lcm([ x for x in range(1, n + 1) ])
    print(result)