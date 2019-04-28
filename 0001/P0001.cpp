#include <iostream>

int naturalSum(int n) {
  return n * (n + 1) / 2;
}

int count(int n) {
  --n;
  return 3 * naturalSum(n / 3) + 5 * naturalSum(n / 5) - 15 * naturalSum(n / 15);
}

int main() {
  int t = 0;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n = 0;
    std::cin >> n;
    int result = count(n);
    std::cout << result << std::endl;
  }

  return 0;
}