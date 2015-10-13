# the function below checks whether the number is prime (returns true or false)
# def is_prime(n)
#   return false if n == 0 || n == 1
#   (2...n).each do |factor|
#     return false if n % factor == 0
#   end
#   true
# end

# the function below adds the numbers that are prime (using the function above) to an array. n_primes is the number of primes you want to add to the array (in our example it is 10)
# def print_prime(n_primes)
#   return [] if n_primes == 0
#   prime_numbers = [2]
#   prime_cache = {}
#   n = 3
#   until prime_numbers.length == n_primes do
#     prime_numbers.push(n) if prime_cache[n]
#     (prime_numbers.push(n) && prime_cache[n] = true) if is_prime(n)
#     n += 1
#   end
#   prime_numbers
# end

def is_prime_new(n_primes)
  numbers = (2..1000).to_a
  primes = []
  begin
    target = numbers.shift
    primes << target
    numbers.reject! do |x|
      x % target == 0
    end
  end until primes.length == n_primes
  primes
end

# the function below takes the array that was created from the above function and makes it into a table
def print_prime_table(n_primes)
  out = ''
  prime_array = is_prime_new(n_primes)
  top_line = "\t#{prime_array.join("\t")}"
  out += top_line + "\n"
  for prime_row in prime_array
    line = ""
    line += "#{prime_row}\t"
    for prime_col in prime_array
      line += "#{prime_row * prime_col}\t"
    end
    out += line + "\n"
  end
  out
end
