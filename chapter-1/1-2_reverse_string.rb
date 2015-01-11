require 'pry'
NULL_DELIMITER = "#"

def c_style_reverse(array_of_chars)
  i = array_of_chars.length - 2
  new_array = []

  index_of_new_array = 0
  until i < 0
    new_array << array_of_chars[i] 
    i -= 1
  end

  new_array << NULL_DELIMITER
end

def c_style_reverse_in_place(array_of_chars)
  i = array_of_chars.length - 2
  k = 0

  until i < (array_of_chars.length / 2)
    tmp = array_of_chars[k]
    array_of_chars[k] = array_of_chars[i]
    array_of_chars[i] = tmp
    i -= 1
    k += 1
  end

  array_of_chars
end

