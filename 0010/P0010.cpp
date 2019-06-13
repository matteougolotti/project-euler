#include <cmath>
#include <iostream>
#include <vector>

bool isPrime(int n, std::vector<int>& primes) {
  int s = sqrt(n);
  
  for (int prime : primes) {
    if (n % prime == 0) return false;
    if (prime > s) return true;
  }
  
  return true;
}

void updatePrimes(int n, std::vector<int>& primes) {
  int nextPrime = primes[primes.size() - 1] + 2;
  while (primes[primes.size() - 1] <= n) {
    if (isPrime(nextPrime, primes)) {
      primes.push_back(nextPrime);
    }
    nextPrime += 2;
  }
}

int sumPrimesSmallerThan(const std::vector<int>& primes, int n) {
  int result = 0;

  for (int prime : primes) {
    if (prime <= n) {
      result += prime;
    }
  }

  return result;
}

int main() {
  std::vector<int> primes{2, 3};
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n;
    std::cin >> n;
    updatePrimes(n, primes);
    int result = sumPrimesSmallerThan(primes, n);
    std::cout << result << std::endl;
  }

}