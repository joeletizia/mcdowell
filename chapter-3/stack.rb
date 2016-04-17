class Stack
  @head = nil

  def push(object)
    node = Node.new(object)
    node.next = @head
    @head = node
    object
  end

  def peek
    @head.value if @head
  end

  def pop
    node = @head

    if node
      @head = node.next
    end

    node ? node.value : nil
  end

  def to_a
    node = @head
    array = []

    while node
      array << node.value
      node = node.next
    end

    array
  end
end

class StackSorter
  def initialize(stack)
    @stack = stack
  end

  def sort
    array = []

    while(stack.peek)
      array << stack.pop
    end

    array.sort.reverse.each do |int|
      stack.push(int)
    end

    stack
  end

  def sort_2_stack
    other_stack = Stack.new

    while stack.peek
      other_stack.push(stack.pop)

      if 
    end
  end

  private

  attr_reader :stack
end

class StackWithMin < Stack
  def push(object)
    node = NodeWithMin.new(object)
    node.next = @head
    @head = node
    if node.next
      node.min = node.next.min < node.value ? node.next.min : node.value
    else
      node.min = node.value
    end
    object
  end

  def min
    @head.min
  end
end

class Node
  attr_accessor :value, :next

  def initialize(object)
    @value = object
  end
end

class NodeWithMin < Node
  attr_accessor :min
end
