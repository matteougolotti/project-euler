#include <iostream>
#include <cmath>

int natual_square_sum(int n) {
  return n * (n + 1) * (2 * n + 1) / 6;
}

int natural_sum_square(int n) {
  return pow(n * (n + 1) / 2, 2);
}

int main() {
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n;
    std::cin >> n;
    int result = natural_sum_square(n) - natual_square_sum(n);
    std::cout << result << std::endl;
  }
}