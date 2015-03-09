class SingleElementFinder
  def single_element(array)
    hash = {}

    array.each do |char|
      hash[char] ||= 0
      hash[char] += 1
    end

    hash.each do |key, value|
      return key if value == 1
    end

    nil
  end
end
