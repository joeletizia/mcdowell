class Fibonacci
  def initialize
    @previous_numbers = [1,1,2]
  end

  def find_fib(number)
    if number <= @previous_numbers.length
      return @previous_numbers[number - 1]
    else
      value = find_fib(number - 1) + find_fib(number - 2)
      @previous_numbers.push(value)
      @previous_numbers[number - 1]
    end
  end
end
