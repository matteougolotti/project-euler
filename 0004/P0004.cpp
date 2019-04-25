#include <iostream>

bool isPalindrome(const std::string& s) {
  return s.size() == 6
      && s[0] == s[5]
      && s[1] == s[4]
      && s[2] == s[3]; 
}

int count(int n) {
  int result = 0;
  for (int i = 100; i < 1000; ++i) {
    for (int j = i; j < 1000; ++j) {
      int p = i * j;
      if (p >= n) break;
      std::string s = std::to_string(p);
      if (isPalindrome(s)) {
        result = std::max(result, p);
      }
    }
  }

  return result;
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
}