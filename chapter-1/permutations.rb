require 'pry'

class Permutator
  def permutate(string)
    length = string.length
    if length == 1
      return [string]
    end
    if length == 2
      return [string, string.reverse]
    end

    permutations = []

    for x in (0...length)
      swap(string, 0, x)
      permutate(string[1...length]).each do |new_string|
        permutations << string[0] + new_string
      end
      swap(string, 0, x)
    end

    permutations
  end

  private

  def swap(string, i, j)
    tmp = string[i]
    string[i] = string[j]
    string[j] = tmp
  end
end
