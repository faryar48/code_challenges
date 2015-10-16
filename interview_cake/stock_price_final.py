from collections import namedtuple
import unittest

def get_max_profit(stock_prices_yesterday):

  if len(stock_prices_yesterday) < 2:
    raise IndexError('must have at least 2 prices for profit')

  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  for index, current_price in enumerate(stock_prices_yesterday):

    if index == 0:
      continue

    potential_profit = current_price - min_price

    max_profit = max(potential_profit, max_profit)

    min_price = min(min_price, current_price)

  return max_profit



# test cases data
T = namedtuple('testdata', ['given', 'expect'])
DATA = (
    T(given = [10, 50, 5, 500, 60], expect = 495),
    T(given = [1, 2, 3, 4, 5], expect = 4),
    T(given = [0, 0, 1, 10, 2], expect = 10),
    T(given = [10, 9, 8, 7, 6], expect = -1),

)
# test runner code
class Test(unittest.TestCase):
    def test(self):
        for given, expected in DATA:
            actual = get_max_profit(given)
            self.assertEqual(expected, actual)
if __name__ == '__main__':
    unittest.main()













































