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

  describe "#delete_at" do
    context "when the given index is out of bounds" do
      it "returns false" do
        list = LinkedList.new([1,2,3]) 
        expect(list.delete_at(3)).to eq(false)
      end
    end

    context "when the given index is not the end" do
      it "clears the node and shifts the next references" do
        list = LinkedList.new([1,2,3]) 
        list.delete_at(1)
        expect(list.to_a).to eq([1,3])
      end
    end

    context "when the given index is at the end" do
      it "sets the reference to nil" do
        list = LinkedList.new([1,2,3]) 
        list.delete_at(2)
        expect(list.to_a).to eq([1,2])
      end
    end

    context "when the given index is 0" do
      it "deletes the head" do
        list = LinkedList.new([1,2,3]) 
        list.delete_at(0)
        expect(list.to_a).to eq([2,3])
      end
    end
  end

  describe "#delete" do
    it "removes any nodes with the given value from the list" do
      list = LinkedList.new([1,2,3,4,5,6])
      list.delete(3)

      expect(list.to_a).to eq([1,2,4,5,6])

      list = LinkedList.new([1])
      list.delete(1)
      expect(list.to_a).to eq([])
    end
  end

  describe "#remove_dupes" do
    it "removes any duplicate entries from the list" do
      list = LinkedList.new([1,2,2,2,5,6])
      list.remove_dupes

      expect(list.to_a).to eq([1,2,5,6])
    end
  end

  describe "delete_nth_from_last" do
    context "when the index is out of bounds" do
      it "returns false" do
        list = LinkedList.new([1,2,2,2,5,6])
        list.delete_nth_from_last(17)
      end
    end
    it "deletes the nth from last" do
      list = LinkedList.new([1,2,2,2,5,6])

      list.delete_nth_from_last(3)
      expect(list.to_a).to eq([1,2,2,5,6])
    end
  end

  describe "[]" do
    it "returns the value at the given position in the list" do
      list = LinkedList.new([1,2,3,4,5,6])
      list.add_to_head(9)

      expect(list[3]).to eq(3)
    end
  end
end
