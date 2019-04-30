#include <algorithm>
#include <cmath>
#include <functional>
#include <iostream>
#include <map>
#include <numeric>
#include <vector>

std::vector<int> getPrimesUpTo(int n) {
  std::vector<int> primes;
  
  std::vector<int> numbers;
  for (int i = 2; i <= n; ++i) {
    numbers.push_back(i);
  }

  while (!numbers.empty()) {
    primes.push_back(numbers[0]);
    numbers.erase(std::remove_if(numbers.begin(),
                                 numbers.end(),
                                 [&] (int i) { return i % numbers[0] == 0; }),
                  numbers.end());
  }

  return primes;
}

std::map<int, int> getPrimeFactors(int n, const std::vector<int>& primes) {
  std::map<int, int> factors;

  for (const int prime : primes) {
    if (prime > n) break;
    while (n % prime == 0) {
      n /= prime;
      if (factors.find(prime) == factors.end()) {
        factors[prime] = 1;
      } else {
        ++factors[prime];
      }
    }
  }

  return factors;
}

int lcm(int x, int y, const std::vector<int>& primes) {
  std::map<int, int> prime_factors_x = getPrimeFactors(x, primes);
  std::map<int, int> prime_factors_y = getPrimeFactors(y, primes);

  int leastCommonMultiple = std::accumulate(primes.begin(), primes.end(), 1, [&] (int acc, int prime) {
    return acc * pow(prime, std::max(prime_factors_x[prime], prime_factors_y[prime]));
  });

  return leastCommonMultiple;
}

int lcm(const std::vector<int>& numbers) {
  if (numbers.empty()) return 0;
  std::vector<int> primes = getPrimesUpTo(*std::max_element(numbers.begin(), numbers.end()));
  return std::accumulate(numbers.begin(), numbers.end(), 1, [&] (int acc, int n) {
    return lcm(acc, n, primes);
  });
}

int main() {
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n;
    std::cin >> n;
    std::vector<int> numbers;
    for (int i = 1; i <= n; ++i) {
      numbers.push_back(i);
    }

    int leastCommonMultiple = lcm(numbers);

    std::cout << leastCommonMultiple << std::endl;
  }

  return 0;
}