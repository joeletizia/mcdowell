require 'spec_helper'
require_relative '../../chapter-1/permutations'

describe Permutator do
  subject(:permutator) { Permutator.new }

  describe "#permutate" do
    it "returns a collection of all the permutations of the string" do
      result = ['abc', 'bac', 'cab', 'acb', 'bca', 'cba']
      expect(permutator.permutate("abc")).to match_array(result)
    end
  end
end
