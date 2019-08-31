import fileinput
import operator
import sys

from functools import reduce
from itertools import product

def _is_valid(row, col):
  return row >= 0 and row < 20 and col >= 0 and col < 20

right = [(0, 0), (0, 1), (0, 2), (0, 3)]
right_up = [(0, 0), (-1, 1), (-2, 2), (-3, 3)]
right_down = [(0, 0), (1, 1), (2, 2), (3, 3)]
down = [(0, 0), (1, 0), (2, 0), (3, 0)]

if __name__ == '__main__':
    table = []
    for i in range(20):
        line = sys.stdin.readline().rstrip('\n')
        table.append(list(map(int, line.split(' '))))

    max_product = max([
      max([
        reduce(operator.mul, [ table[row + x][col + y] for x, y in right if _is_valid(row + x, col + y) ], 1),
        reduce(operator.mul, [ table[row + x][col + y] for x, y in right_up if _is_valid(row + x, col + y) ], 1),
        reduce(operator.mul, [ table[row + x][col + y] for x, y in right_down if _is_valid(row + x, col + y) ], 1),
        reduce(operator.mul, [ table[row + x][col + y] for x, y in down if _is_valid(row + x, col + y) ], 1)
      ]) for row in range(20) for col in range(20)
    ])

    print(max_product)
