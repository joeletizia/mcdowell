class Bitset
  def initialize(size)
    @data = Array.new(size/8, 0)
  end

  def set(index)
    int_to_shift = index/8
    bit_to_set = index%8

    i = @data[int_to_shift]
    manipulator = 1 << bit_to_set

    @data[int_to_shift] = i | manipulator
  end

  def [](index)
    int_to_read = index/8
    bit_to_read = index%8

    (@data[int_to_read] & (1 << bit_to_read)) != 0
  end
end


def find_dupes(array)
  bitset = Bitset.new(32000)
  dupes = []
  array.each do |item|
    dupes << item if bitset[item]
    bitset.set(item)
  end

  dupes
end
