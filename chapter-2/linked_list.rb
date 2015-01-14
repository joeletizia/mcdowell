require 'pry'

class LinkedList
  def initialize(node_values=[])
    @head = Node.new(node_values[0])
    current_node = @head

    node_values[1..(node_values.length-1)].each do |node_value|
      current_node.next = Node.new(node_value)
      current_node = current_node.next
    end
  end

  def add_to_end(value)
    node = @head
    until node.next == nil
      node = node.next
    end

    new_node = Node.new(value)
    node.next = new_node
  end

  def add_to_head(value)
    new_head = Node.new(value)

    new_head.next = @head.dup
    @head = new_head
  end

  def to_a
    array = []
    current_node = @head

    until current_node.next == nil
      array << current_node.value
      current_node = current_node.next
    end

    array << current_node.value
  end
end

class Node
  def initialize(value)
    @value = value
    @next = nil
  end

  attr_accessor :next, :value
end
