require 'spec_helper'
require_relative '../../chapter-2/linked_list'

describe LinkedList do
  describe "#add_to_end" do
    it "adds a node to the end of the list" do
      list = LinkedList.new([1,2,3,4,5,6])
      list.add_to_end(7)

      expect(list.to_a).to eq([1,2,3,4,5,6,7])
    end
  end

  describe "#add_to_head" do
    it "adds a node to the start of the list" do
      list = LinkedList.new([1])
      list.add_to_head(2)

      expect(list.to_a).to eq([2, 1])
    end
  end
end
