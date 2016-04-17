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

def delete_from_tree(root, val)
  while root && root.value != val
    if root.value > val
      root = root.left
    else
      root = root.right
    end
  end

  if root
    successor = right_most_child(root.left)
    if successor
      root.value = successor.value
      delete_from_tree(root.left, val) if root.value
    else
      if root.parent.left == root
        root.parent.left = nil
      else
        root.parent.right = nil
      end
    end
  end
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

def right_most_child(node)
  while node && node.right
    node = node.right
  end

  node
end

def left_most_child(node)
  while node && node.left
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

def equal_trees?(tree_1, tree_2)
  return true if tree_1.nil? && tree_2.nil?
  return false if tree_1.nil? || tree_2.nil?
  return false unless tree_1.value == tree_2.value
  return false unless equal_trees?(tree_1.left, tree_2.left)
  return false unless equal_trees?(tree_1.right, tree_2.right)

  true
end
