#include <algorithm>
#include <functional>
#include <numeric>
#include <iostream>
#include <vector>

bool isValid(int row, int col) {
  return row >= 0 && row < 20 && col >= 0 && col < 20;
}

int product(const std::vector<std::vector<int>>& table,
            int row,
            int col,
            const std::vector<std::pair<int, int>>& items) {
  std::vector<int> numbers;
  for (const auto& rowAndCol : items) {
    if (isValid(row + rowAndCol.first, col + rowAndCol.second)) {
      numbers.push_back(table[row + rowAndCol.first][col + rowAndCol.second]);
    }
  }

  return std::accumulate(numbers.begin(),
                         numbers.end(),
                         1,
                         std::multiplies<int>());
}

int main() {
  std::vector<std::vector<int>> table;
  for (int r = 0; r < 20; ++r) {
    std::vector<int> row(20);
    for (int c = 0; c < 20; ++c) {
      std::cin >> row[c];
    }
    table.push_back(row);
  }

  const std::vector<std::pair<int, int>> right{{0, 0}, {0, 1}, {0, 2}, {0, 3}};
  const std::vector<std::pair<int, int>> right_down{{0, 0}, {1, 1}, {2, 2}, {3, 3}};
  const std::vector<std::pair<int, int>> right_up{{0, 0}, {-1, 1}, {-2, 2}, {-3, 3}};
  const std::vector<std::pair<int, int>> down{{0, 0}, {1, 0}, {2, 0}, {3, 0}};

  int max_product = 0;
  for (int r = 0; r < 20; ++r) {
    for (int c = 0; c < 20; ++c) {
      max_product = std::max(max_product, product(table, r, c, right));
      max_product = std::max(max_product, product(table, r, c, right_down));
      max_product = std::max(max_product, product(table, r, c, right_up));
      max_product = std::max(max_product, product(table, r, c, down));
    }
  }

  std::cout << max_product;

  return 0;
}