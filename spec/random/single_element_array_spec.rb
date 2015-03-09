require 'spec_helper'
require_relative '../../random/single_element_array'

describe SingleElementFinder do
  subject(:finder) { SingleElementFinder.new }

  describe "#single_element" do
    it "returns the first element in the array that occurs once" do
      expect(finder.single_element("aaaabbbbccccd".split(""))).to eq('d')
    end

    it "returns nil if there are no uniques" do
      expect(finder.single_element("aaaabbbbcccc".split(""))).to eq(nil)
    end
  end
end

