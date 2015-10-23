# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

# given: [1, 2, 6, 5, 9]
# expected: [540, 270, 90, 108, 60]

# output:

# [2*6*5*9, 1*6*5*9, 1*2*5*9, 1*2*6*9, 1*2*6*5]

# def get_products_of_all_ints_except_at_index(numbers_array)
#   products_array = []
#   blk = lambda do |num, i|
#       numbers_array.delete(num)
#       products_array.push(numbers_array.reduce(1, :*))
#       numbers_array.insert(i, num)
#   end
#   numbers_array.each_with_index &blk
#   return products_array
# end

def get_products_of_all_ints_except_at_index(numbers_array)
  numbers_array.each.with_index.reduce([[], numbers_array.dup], &method(:reducer)).first
end



def reducer(memo, item_and_index)
  item, index = item_and_index
  products_array, numbers_array = memo

  numbers_array.delete(item)
  products_array.push(numbers_array.reduce(:*))
  numbers_array.insert(index, item)
  [products_array, numbers_array]
end


# def get_products_of_all_ints_except_at_index(numbers_array)
#   numbers_array.each do |num_one, i_one|
#     numbers_array.each_with_index do |num_two, i_two|

#     end
#   end
# end

numbers_array.reduce(&method(:add))


def add(a, b)
  a + b
end

test_cases = [
  {given: [1, 7, 3, 4], expected: [84, 12, 28, 21]},
  {given: [1, 2, 6, 5, 9], expected: [540, 270, 90, 108, 60]},

]

p "get_products_of_all_ints_except_at_index"
test_cases.each do |test_case|
  actual = get_products_of_all_ints_except_at_index(test_case[:given])
  if actual == test_case[:expected]
    p "pass"
  else
    p "fail", actual, test_case[:expected]
    exit
  end
end