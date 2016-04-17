require 'spec_helper'
require_relative '../../chapter-3/stack'

describe Stack do
  describe "#push" do
    it "adds the given object to the stack" do
      stack = Stack.new
      stack.push(3)
      expect(stack.to_a).to eq([3])
      stack.push(4)
      expect(stack.to_a).to eq([4,3])
    end
  end

  describe "#pop" do
    it "removes the head node from the stack" do
      stack = Stack.new
      stack.push(3)
      expect(stack.to_a).to eq([3])
      stack.pop
      expect(stack.to_a).to eq([])
    end
  end
end

describe StackSorter do
  describe "#sort" do
    it "returns a sorted stack" do
      stack = Stack.new
      stack.push(3)
      stack.push(1)
      stack.push(2)
      ret = StackSorter.new(stack).sort
      expect(stack.to_a).to eq([1,2,3])
    end
  end

  describe "#sort_2_stack" do
    it "returns a sorted stack" do
      stack = Stack.new
      stack.push(3)
      stack.push(1)
      stack.push(2)
      ret = StackSorter.new(stack).sort_2_stack
      expect(stack.to_a).to eq([1,2,3])
    end
  end
end

describe StackWithMin do
  describe "#min" do
    it "returns the smallest element of the stack" do
      stack = StackWithMin.new
      stack.push(3)
      expect(stack.min).to eq(3)
      stack.push(2)
      expect(stack.min).to eq(2)
      stack.push(5)
      expect(stack.min).to eq(2)
      stack.push(2)
      expect(stack.min).to eq(2)
      stack.pop
      expect(stack.min).to eq(2)
    end
  end
end


