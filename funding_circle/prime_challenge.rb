# the function below checks whether the number is prime (returns true or false)
def is_prime(n)
  return false if n == 0 || n == 1
  (2...n).each do |factor|
    return false if n % factor == 0
  end
  true
end

# the function below adds the numbers that are prime (using the function above) to an array. n_primes is the number of primes you want to add to the array (in our example it is 10)
def print_prime(n_primes)
  return [] if n_primes == 0
  prime_numbers = [2]
  prime_cache = {}
  n = 3
  until prime_numbers.length == n_primes do
    prime_numbers.push(n) if prime_cache[n]
    (prime_numbers.push(n) && prime_cache[n] = true) if is_prime(n)
    n += 1
  end
  prime_numbers
end

# the function below takes the array that was created from the above function and makes it into a table
def print_prime_table(n_primes)
  out = ''
  prime_array = print_prime(n_primes)
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

unless ENV.has_key? 'TEST'
  puts print_prime_table(10)
else
  # to run the tests below, run `TEST=true rspec prime_challenge.rb` in the command line
  describe "is_prime (aka check if the number if prime or not - return value is a boolean)" do
    it "knows that 0 is NOT a prime number (returns true)" do
      expect(is_prime(0)).to equal(false)
    end


    it "knows that 1 is NOT a prime number (returns true)" do
      expect(is_prime(1)).to equal(false)
    end


    it "knows that 2 is a prime number (returns true)" do
      expect(is_prime(2)).to equal(true)
    end

    it "knows that 3 is a prime number (returns true)" do
      expect(is_prime(3)).to equal(true)
    end

    it "knows that 5 is a prime number (returns true)" do
      expect(is_prime(5)).to equal(true)
    end

    it "knows that 6 is NOT a prime number (returns false)" do
      expect(is_prime(6)).to equal(false)
    end
  end

  describe "print_prime(n_primes)" do
    it "returns an empty array" do
      expect(print_prime(0)).to eq([])
    end

    it "returns an array with the first prime number" do
      expect(print_prime(1)).to eq([2])
    end

    it "returns an array with the first 5 prime numbers" do
      expect(print_prime(5)).to eq([2, 3, 5, 7, 11])
    end

    it "returns an array with the first 10 prime numbers" do
      expect(print_prime(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end

  # this test doesn't come out pretty but it does still show that we get the correct answer
  describe "print_prime_table(n_primes)" do
    it "returns an empty table when n_primes = 0" do
      expect(print_prime_table(0).gsub( /\t|\n/, '')).to eq('')
    end

    it "returns a table with the product of the first prime number (2 * 2 = 4)" do
      expect(print_prime_table(1).gsub( /\t|\n/, '')).to eq('224')
    end
  end

end
