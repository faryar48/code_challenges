class Prime

  attr_accessor :n_primes, :prime_cache, :prime_numbers

  def initialize
    @prime_cache = {}
    @prime_numbers = [2]
  end

  def get_n_primes
    p 'How many primes do you want?'
    response = gets.chomp.to_i
  end

  def is_prime(n)
    return false if n == 0 || n == 1
    # couldn't do step here since for example when n = 9, the Math.sqrt = 3 and it would skip 3 as a factor and would therefore return true
    (2..(Math.sqrt(n)).to_i).each do |factor|
      return false if n % factor == 0
    end
    true
  end

  # the function below adds the numbers that are prime (using the function above) to an array. n_primes is the number of primes you want to add to the array (in our example it is 10)
  def print_prime
    @n_primes = get_n_primes
    return [] if @n_primes == 0
    p_arr_len = @prime_numbers.length
    return @prime_numbers[0..@n_primes] if p_arr_len >= @n_primes
    (p_arr_len > 1) ? (n = @prime_numbers.last) : (n = 3)
    until @prime_numbers.length == @n_primes do
      @prime_numbers.push(n) if @prime_cache[n]
      (@prime_numbers.push(n) && @prime_cache[n] = true) if is_prime(n)
      n += 1
    end
    @prime_numbers
  end

  # the function below takes the array that was created from the above function and makes it into a table
  def print_prime_table
    out = ''
    prime_array = print_prime
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
end

prime_table = Prime.new
puts prime_table.print_prime_table
puts prime_table.print_prime_table








