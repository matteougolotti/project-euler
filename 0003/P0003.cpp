#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

long largestPrimeFactor(long n) {
  std::vector<long> prime_factors;

  for (long i = 2; i < sqrt(n) + 1; ++i) {
    while (n % i == 0) {
      n = n / i;
      prime_factors.push_back(i);
    }
  }

  if (n > 2) {
    prime_factors.push_back(n);
  }

  return *std::max_element(prime_factors.begin(), prime_factors.end());
}

int main() {
  int t{0};

  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    long n{0};
    std::cin >> n;

    long gpf = largestPrimeFactor(n);

    std::cout << gpf << std::endl;
  }

}