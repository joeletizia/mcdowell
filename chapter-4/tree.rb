require 'thread'
require 'pry'

class BinaryTreeNode
  def initialize(value)
    @value = value
  end

  def pre_order_traverse(nodes = [])
    nodes << self.value
    left.pre_order_traverse(nodes) if left
    right.pre_order_traverse(nodes) if right
    nodes
  end

  def in_order_traverse(nodes = [])
    left.in_order_traverse(nodes) if left
    nodes << self.value
    right.in_order_traverse(nodes) if right
    nodes
  end

  def post_order_traverse(nodes = [])
    left.post_order_traverse(nodes) if left
    right.post_order_traverse(nodes) if right
    nodes << self.value
    nodes
  end

  attr_accessor :value, :left, :right, :parent
end

array = (1..10).to_a

[1,2,3,4,5,6,7,8,9,10]

def bfs_traversal(node, levels = {}, level_count = 0)
  levels[level_count] ||= []
  levels[level_count] << node.value

  bfs_traversal(node.left, levels, level_count + 1) if node.left
  bfs_traversal(node.right, levels, level_count + 1) if node.right

  levels
end

def tree_from_array(array, parent = nil)
  if array.length > 0
    root = BinaryTreeNode.new(array[array.length/2])
    root.parent = parent

    if array[0...array.length/2].length > 0
      root.left = tree_from_array(array[0...array.length/2], root)
    end
    if array[array.length/2...array.length].length > 0
      root.right = tree_from_array(array[array.length/2 + 1...array.length], root)
    end
  end

  root
end

def in_order_successor(node)
  if node.right
    return left_most_child(node.right)
  end

  while p = node.parent
    if p.left = node
      break
    end

    node = p
  end

  return p.value || nil
end

def left_most_child(node)
  while node.left
    node = node.left
  end

  node
end

def common_ancestor(tree, p, q)
  if covers?(p, tree.left) && covers?(q, tree.left)
    return common_ancestor(tree.left, p, q)
  end

  if covers?(p, tree.right) && covers?(q, tree.right)
    return common_ancestor(tree.right, p, q)
  end

  return tree
end

def covers?(value, tree)
  tree.in_order_traverse.include?(value)
end
