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

  describe "#n_choose_k" do
    it "returns all permutations in n of size k" do
      result = ['ab', 'ba', 'ca', 'ac', 'bc', 'cb']
      expect(permutator.n_choose_k("abc", 2)).to match_array(result)
    end
  end

  describe "#heaps_algorithm" do
    it "returns a collection of all the permutations of the string" do
      result = ['abc', 'bac', 'cab', 'acb', 'bca', 'cba']
      expect(permutator.heaps_algorithm(3, "abc".split(""))).to match_array(result)
    end
  end
end
