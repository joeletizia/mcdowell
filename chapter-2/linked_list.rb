require 'pry'

class LinkedList
  def initialize(node_values=[])
    unless node_values.empty?
      @head = Node.new(node_values[0])
      @length = 1
      current_node = @head

      node_values[1..(node_values.length-1)].each do |node_value|
        current_node.next = Node.new(node_value)
        current_node = current_node.next
        increment_length
      end
    else
      @head = nil
      @length = 0
    end
  end

  def [](index)
    current_node = @head

    while current_node && index > 0
      current_node = current_node.next
      index -= 1
    end

    current_node.value
  end

  def beginning_of_cycle_in_list
    node = @head

    visited_nodes = {node => 1}

    while node.next
      node = node.next
      if visited_nodes[node]
        return node
      else
        visted_nodes[node] = 1
      end
    end

    return nil
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      decrement_length
      return value
    end

    current_node = @head
    while current_node.next != nil
      if current_node.next.value == value
        current_node.next = current_node.next.next
        decrement_length
        return value
      end

      current_node = current_node.next
    end

    return nil
  end

  def delete_at(n)
    return false if n >= @length

    if n == 0
      tmp = @head
      @head = @head.next
      return tmp
    end

    node = @head
    until n == 1
      node = node.next
      n -= 1
    end

    if node.next && node.next.next
      node.next.value = nil
      value = node.next.value
      node.next = node.next.next
      return value
    else
      node.next = nil
    end
  end

  def add_to_end(value)
    node = @head
    until node.next == nil
      node = node.next
    end

    new_node = Node.new(value)
    increment_length
    node.next = new_node
  end

  def delete_nth_from_last(n)
    index_to_delete = @length - n
    return false if index_to_delete < 0

    delete_at(index_to_delete)
  end

  def remove_dupes
    value_count = {}

    node = @head

    while node.next
      if value_count[node.value]
        value_count[node.value] += 1
      else
        value_count[node.value] = 1
      end

      node = node.next
    end

    value_count.select{|key, value| value > 1}.each do |key, value|
      (value - 1).times do
        self.delete(key)
      end
    end
  end

  def add_to_head(value)
    new_head = Node.new(value)

    if @head
      new_head.next = @head.dup
      @head = new_head
    else
      @head = new_head
    end
  end

  def partition(k)
    greater_list = LinkedList.new
    less_list = LinkedList.new

    node = @head

    while node
      if node.value < k
        less_list.add_to_head(node.value)
      else
        greater_list.add_to_head(node.value)
      end
      node = node.next
    end

    array = less_list.to_a + greater_list.to_a
    LinkedList.new(array)
  end

  def to_a
    array = []
    current_node = @head

    return array unless current_node

    until current_node.next == nil
      array << current_node.value
      current_node = current_node.next
    end

    array << current_node.value
  end

  private

  def increment_length
    @length += 1
  end

  def decrement_length
    @length -= 1
  end

  class Node
    def initialize(value)
      @value = value
      @next = nil
    end

    attr_accessor :next, :value
  end
end

