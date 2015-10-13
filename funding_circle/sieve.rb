class Sieve
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def primes
    numbers = (2..@number).to_a
    primes = []
    begin
      target = numbers.shift
      primes << target
      numbers.reject! do |x|
        x % target == 0
      end
    end until numbers.empty?
    primes
  end

end

p Sieve.new(1000).primes

