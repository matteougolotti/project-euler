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

int prime(int n, std::vector<int>& primes) {
  int nextPrime = primes[primes.size() - 1] + 2;
  while (primes.size() <= n) {
    if (isPrime(nextPrime, primes)) {
      primes.push_back(nextPrime);
    }
    nextPrime += 2;
  }

  return primes[n - 1];
}

int main() {
  std::vector<int> primes{2, 3};
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n;
    std::cin >> n;
    int p = prime(n, primes);
    std::cout << p << std::endl;
  }

}