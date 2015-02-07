require 'pry'


def remove_dupes(string)
  return unless string
  length = string.length
  return if length < 2

  i = 1
  tail = 1
  removal_tally = 0

  while i < length
    j = 0
    while j < tail
      if string[i] == string[j]
        removal_tally += 1
        break
      end
      j += 1
    end

    if j == tail
      string[tail] = string[i]
      tail += 1
    end

    i += 1
  end

  string[0...length-removal_tally]
end
