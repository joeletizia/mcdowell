require 'spec_helper'
require_relative '../../chapter-4/tree'

describe BinaryTreeNode do
  subject(:tree) { BinaryTreeNode.new }

  describe "#delete_from_tree" do
    it "deletes the node from the tree" do
      array = (1..10).to_a
      tree = tree_from_array(array)

      delete_from_tree(tree, 4)
      expect(tree.in_order_traverse).to_not include(4)
    end
  end
end
