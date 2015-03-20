require 'pry'

class Sorting
  def merge_sort(array)
    length  = array.length

    return array if length <= 1

    left = merge_sort(array[0...length/2])
    right = merge_sort(array[length/2...array.length])

    merge(left, right)
  end

  private

  def merge(left, right)
    return_array = []

    until left.empty? || right.empty?
      return_array << (left.first <= right.first ? left.shift : right.shift)
    end

    return_array + left + right
  end
end
