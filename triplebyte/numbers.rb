# The first 12 digits of pi are 314159265358.
# We can make these digits into an expression evaluating to 27182 (first 5 digits of e) as follows:

# 3141 * 5 / 9 * 26 / 5 * 3 - 5 * 8 = 27182
# or
# 3 + 1 - 415 * 92 + 65358 = 27182

# Notice that the order of the input digits is not changed. Operators (+,-,/, or *) are simply inserted to create the expression.

# Write a function to take a list of numbers and a target, and return all the ways that those numbers can be formed into expressions evaluating to the target

# For example:
# f("314159265358", 27182) should print:

# 3 + 1 - 415 * 92 + 65358 = 27182
# 3 * 1 + 4 * 159 + 26535 + 8 = 27182
# 3 / 1 + 4 * 159 + 26535 + 8 = 27182
# 3 * 14 * 15 + 9 + 26535 + 8 = 27182
# 3141 * 5 / 9 * 26 / 5 * 3 - 5 * 8 = 27182


def check(sum, previous, digits, target, expression)
  if digits.length == 0
    if (sum + previous == target)
      puts "#{expression} = #{target}"
    end
  else
    digits = digits.to_s
    digits.split("").each_with_index do |num, i|
      current = (digits[0, i]).to_i
      remaining = digits[i]
      check(sum + previous, current, remaining, target, "#{expression} + #{current}")
      check(sum, previous * current, remaining, target, "#{expression} * #{current}")
      new_previous = previous / current
      check(sum, new_previous, remaining, target, "#{expression} / #{current}")
      check(sum + previous, - current, remaining, target, "#{expression} - #{current}")
    end
  end
end


def f(string, target)
  string.split("").each_with_index do |letter, i|
    current = string[0, i]
    check(0, current.to_i, string[i], target, current)
  end
end



p f("314159265358", 27182)

