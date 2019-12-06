#include <cmath>
#include <iostream>
#include <vector>
#include <utility>

std::vector<int> calculate_primes(int n) {
  std::vector<int> primes;
  std::vector<bool> is_prime(n+1);

  for (int i = 0; i < is_prime.size(); ++i) {
    is_prime[i] = true;
  }

  is_prime[0] = false;
  is_prime[1] = false;

  for (int i = 2; i < is_prime.size(); ++i) {
    if (is_prime[i]) {
      primes.push_back(i);
      for (int j = i + i; j < is_prime.size(); j += i) {
        is_prime[j] = false;
      }
    }
  }

  return primes;
}

std::vector<std::pair<int, int>> prime_factors(int n, const std::vector<int>& primes) {
  std::vector<std::pair<int, int>> factors;

  for (int prime : primes) {
    int power = 0;
    while (n % prime == 0) {
      n /= prime;
      ++power;
    }

    if (power > 0) {
      std::pair<int, int> factor(prime, power);
      factors.push_back(factor);
    }
    
    if (n == 1) {
      break;
    }
  }

  return factors;
}

int fast_count_factors(int n, const std::vector<int>& primes) {
  const std::vector<std::pair<int, int>> factors = prime_factors(n, primes);

  int count = 1;
  for (const std::pair<int , int>& factor_and_power : factors) {
    count *= factor_and_power.second + 1;
  }

  return count;
}

int calculate_triangle(int n) {
  return n * (n + 1) / 2;
}

int main() {
  const std::vector<int> primes = calculate_primes(100);
  std::vector<int> cache(1001);
  int n = 0;
  int triangle = 0;
  int factors = 0;
  for (int i = 1; i < 1001; ++i) {
    while (true) {
      if (factors > i) {
        cache[i] = triangle;
	break;
      } else {
	++n;
        triangle = calculate_triangle(n);
	factors = fast_count_factors(triangle, primes);
      }
    }
  }

  int t = 0;
  std::cin >> t;
  for (int i=0; i < t; ++i) {
    int n = 0;
    std::cin >> n;
    std::cout << cache[n] << std::endl;
  }
}
