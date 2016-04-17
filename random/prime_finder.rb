class PrimeFinder
  def initialize()
    @prime_tests = {1 => true, 2 => true, 3 => true}
  end

  def nth_prime(n)
    if n <= @primes.length
      return @primes[n-1]
    else
      for i in (current_largest_prime..Float::INFINITY)
        break if prime?(i)
      end
      
    end
  end

  private

  def current_largest_prime
    @primes[@primes.length - 1]
  end

  def prime?(number)
    current_value = 2

    while current_value < Math.sqrt(number)
      number % current_value == 0
      current_value += 1
    end

    true
  end
end
