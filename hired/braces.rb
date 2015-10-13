require 'pry'

expressions = [")(){}", "[]({})", "([])", "{()[]}", "([)]"] 

def check_braces(expressions)
  stack = []
  output = 1 
  symbols = { '{' => '}', '[' => ']', '(' => ')' }
  expressions.each do |word|
    word.each_char do |c|
      stack << c if symbols.key?(c)
      if symbols.key(c) && symbols.key(c) != stack.pop
        output = 0 
      end
    end
  end
  p output
end 

# p check_braces(")(){}") # false 
# p check_braces("[]({})") # true 
# p check_braces("([])") # true 
# p check_braces("{()[]}") # true 
# p check_braces("([)]") # false 

check_braces(expressions) 
