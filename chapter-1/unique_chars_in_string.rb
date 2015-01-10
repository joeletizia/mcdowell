class String
  def contains_unique_chars?
    map = {}

    self.each_char do |letter|
      return false if map[letter] != nil
      map[letter] = true
    end

    return true
  end

  def contains_unique_chars_without_hash?
    self.split("").each_with_index do |letter, index|
      self.split("").each_with_index do |other_letter, other_index|
        return false if other_letter == letter and index != other_index
      end
    end

    return true
  end
end

puts "Correct!" if "abc".contains_unique_chars? == true
puts "Correct!" if "aa".contains_unique_chars? == false

puts "Correct!" if "abc".contains_unique_chars_without_hash? == true
puts "Correct!" if "aa".contains_unique_chars_without_hash? == false
