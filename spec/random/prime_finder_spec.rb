require 'spec_helper'
require_relative '../../random/prime_finder'

describe PrimeFinder do
  subject(:prime_finder) { PrimeFinder.new }

  describe "nth_prime" do
    # 15  => 47
    it "returns the nth prime" do
      expect(prime_finder.nth_prime(15)).to eq(47)
    end
  end
end
