# Suppose we could access yesterday's stock prices as an array, where:

# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# For example, if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.

# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

# No shorting, you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass)

# import code;
# code.interact(local=locals())

from collections import namedtuple
import unittest


my_stock_prices_one = [10, 50, 5, 500, 60]
my_stock_prices_two = [1, 2, 3, 4, 5]
my_stock_prices_three = [0, 0, 1, 10, 2]
my_stock_prices_four = [10, 9, 8, 7, 6]



def get_max_profit(stock_prices_yesterday):

  max_profit = 0


  for outer_time in xrange(len(stock_prices_yesterday)):

    for inner_time in xrange(len(stock_prices_yesterday)):

      # print inner_time, outer_time
      earlier_time = min(inner_time, outer_time)
      later_time = max(inner_time, outer_time)

      earlier_price = stock_prices_yesterday[earlier_time]
      later_price = stock_prices_yesterday[later_time]

      potential_profit = later_price - earlier_price

      max_profit = max(max_profit, potential_profit)


  return max_profit


def get_max_profit_v2(stock_prices_yesterday):

  max_profit = 0

  for earlier_time, earlier_price in enumerate(stock_prices_yesterday):

    for later_price in stock_prices_yesterday[earlier_time:]:

      # print later_price, earlier_price
      potential_profit = later_price - earlier_price

      max_profit = max(potential_profit, max_profit)

  return max_profit


def get_max_profit_v3(stock_prices_yesterday):

  if len(stock_prices_yesterday) < 2:
    raise IndexError('stock prices need at least 2 prices to compute a profit')

  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  for index, current_price in enumerate(stock_prices_yesterday):

    if index == 0:
      continue

      potential_profit = current_price - min_price

      max_profit = max(potential_profit, max_profit)

      min_price = min(min_price, current_price)


  return max_profit

# print get_max_profit(my_stock_prices_one)
# print get_max_profit(my_stock_prices_two)
# print get_max_profit(my_stock_prices_three)

# print get_max_profit_v2(my_stock_prices_one)
# print get_max_profit_v2(my_stock_prices_two)
# print get_max_profit_v2(my_stock_prices_three)

print get_max_profit_v3(my_stock_prices_one)
print get_max_profit_v3(my_stock_prices_two)
print get_max_profit_v3(my_stock_prices_three)
print get_max_profit_v3(my_stock_prices_four)

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
            actual = get_max_profit_v3(given)
            self.assertEqual(expected, actual)
if __name__ == '__main__':
    unittest.main()










