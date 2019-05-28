#include <cmath>
#include <iostream>

int count(int n) {
  int result = -1;

  for (int a = 1; a < (n / 3); ++a) {
    int c = (-2 * a * a + a * n * 2 - n * n) / ((a - n) * 2);
    int b = std::sqrt(c * c - a * a);
    if (a + b + c == n && a * a + b * b == c * c) {
      result = std::max(result, a * b * c);
    }
  }

  return result;
}

int main() {
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n;
    std::cin >> n;
    int result = count(n);
    std::cout << result << std::endl;
  }
}