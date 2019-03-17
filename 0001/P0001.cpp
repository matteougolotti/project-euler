#include <cassert>

int naturalSum(int n) {
  return n * (n + 1) / 2;
}

int count(int n) {
  --n;
  return 3 * naturalSum(n / 3) + 5 * naturalSum(n / 5) - 15 * naturalSum(n / 15);
}

int main() {
  assert(23 == count(10));
  assert(2318 == count(100));

  return 0;
}