require_relative './stack'
require 'pry'

class MyQueue
  def initialize
    @stack_one = Stack.new
    @stack_two = Stack.new
  end

  def enqueue(value)
    @stack_one.push(value)
  end

  def dequeue
    while @stack_one.peek
      @stack_two.push(@stack_one.pop)
    end

    return_value = @stack_two.pop

    while @stack_two.peek
      @stack_one.push(@stack_two.pop)
    end

    return_value
  end
end
