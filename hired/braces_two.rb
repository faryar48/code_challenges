require 'pry'

expressions = [")(){}", "[]({})", "([])", "{()[]}", "([)]"] 

def check_braces(expressions)
  stack = []
  output = 1 
  symbols = { '{' => '}', '[' => ']', '(' => ')' }
    expressions.each_char do |c|
      stack << c if symbols.key?(c)
      if symbols.key(c) && symbols.key(c) != stack.pop
        output = 0 
      end
    end
    return output 
end 



p check_braces(")(){}") # 0 
p check_braces("[]({})") # 1 
p check_braces("([])") # 1 
p check_braces("{()[]}") # 1 
p check_braces("([)]") # 0 

