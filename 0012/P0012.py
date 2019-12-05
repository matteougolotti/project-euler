import math

from typing import List, Tuple

def calculate_primes(n: int) -> List[int]:
    is_prime = [True for i in range(n+1)]
    is_prime[0] = False
    is_prime[1] = False
    for i in range(2, n+1):
        if is_prime[i]:
            for j in range(2 * i, n+1, i):
                is_prime[j] = False
    return [i for i in range(n+1) if is_prime[i]]

def prime_factors(n: int, primes: List[int]) -> List[Tuple[int, int]]:
    factors = []
    for prime in primes:
        power = 0
        while n % prime == 0:
            n /= prime
            power += 1
        if power > 0:
            factors.append((prime, power))
        if n == 1:
            break
    return factors

def fast_count_factors(n: int, primes: List[int]) -> int:
    factors = prime_factors(n, primes)
    count = 1
    for (_factor, power) in factors:
        count *= power + 1
    return count

def calculate_triangles():
    n = 1
    while True:
        yield n * (n + 1) / 2
        n += 1

if __name__ == '__main__':
    primes = calculate_primes(100)
    cache = [None for _ in range(1001)]
    triangles = calculate_triangles()
    triangle = 0
    factors = 0
    for i in range(1, 1001):
        while True:
            if factors > i:
                cache[i] = triangle
                break
            else:
                triangle = next(triangles)
                factors = fast_count_factors(triangle, primes)

    t = int(input())
    for _ in range(t):
        n = int(input())
        print(int(cache[n]))
