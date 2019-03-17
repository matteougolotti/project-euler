import unittest

def natural_sum(x):
    return x * (x + 1) // 2

def count(n):
    n = n - 1
    return 3 * natural_sum(n // 3) + 5 * natural_sum(n // 5) - 15 * natural_sum(n // 15)

class TestSuite(unittest.TestCase):

  def test_case(self):
    self.assertEqual(23, count(10))
    self.assertEqual(2318, count(100))

if __name__ == "__main__":
  unittest.main()