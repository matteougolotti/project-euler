#include <algorithm>
#include <iostream>
#include <functional>
#include <vector>

int count(const std::vector<int>& numbers, int k) {
  int maxProduct = 0;
  for (int i = 0; i < numbers.size() - k; ++i) {
    int product = 1;
    for (int j = i; j < i + k; ++j) {
      product *= numbers[j];
    }
    maxProduct = std::max(maxProduct, product);
  }

  return maxProduct;
}

int main() {
  int t;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n, k;
    std::cin >> n >> k;
    std::string s;
    std::cin >> s;
    std::vector<int> numbers;
    std::transform(s.begin(), s.end(), std::back_inserter(numbers), [&] (const char& c) {
      return int(c - '0');
    });

    int result = count(numbers, k);

    std::cout << result << std::endl;
  }
}