#include <iostream>
#include <set>

bool isPalindrome(const std::string& s) {
  return s.size() == 6
      && s[0] == s[5]
      && s[1] == s[4]
      && s[2] == s[3];
}

std::set<int> findValidPalindromes() {
  std::set<int> palindromes;

  for (int i = 0; i < 1000; ++i) {
    for (int j = i; j < 1000; ++j) {
      int p = i * j;
      const std::string s = std::to_string(p);
      if (isPalindrome(s)) {
        palindromes.insert(p);
      }
    }
  }

  return palindromes;
}

int findLargestPalindrome(int n, const std::set<int>& s) {
  int largestPalindrome = 0;
  for (const int p : s) {
    if (p < n) {
      largestPalindrome = std::max(p, largestPalindrome);
    }
  }

  return largestPalindrome;
}

int main() {
  const auto palindromes = findValidPalindromes();
  int t = 0;
  std::cin >> t;
  for (int i = 0; i < t; ++i) {
    int n = 0;
    std::cin >> n;
    int result = findLargestPalindrome(n, palindromes);
    std::cout << result << std::endl;
  }
}