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

  def heaps_algorithm(n, array)
    if n == 1
      return array.join("")
    else
      permutations = []

      for i in (0..n) 
        permutations << heaps_algorithm(n - 1, array)

        if n.odd?
          swap(array, 0, n - 1)
        else
          swap(array, i, n - 1)
        end
      end
    end

    permutations.flatten.uniq
  end

  def n_choose_k(string, k)
    permutations = permutate(string)

    permutations.map do |permutation|
      permutation[0..k-1]
    end
  end

  private

  def swap(string, i, j)
    tmp = string[i]
    string[i] = string[j]
    string[j] = tmp
  end
end
