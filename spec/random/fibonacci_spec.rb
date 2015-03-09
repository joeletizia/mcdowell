require 'spec_helper'
require_relative '../../random/fibonacci'

describe Fibonacci do
  subject(:fibonacci) { Fibonacci.new }

  describe "#find_fib" do
    it "returns the nth fibonacci number" do
      #  => 1,1,2,3,5,8,13...
      expect(fibonacci.find_fib(20)).to eq(6765)
    end
  end
end
