def closest_one_counts(n)
  one_count_n = count_ones(n)
  puts "n has #{one_count_n} 1s"

  j = n + 1

  while(j)
    break if count_ones(j) == one_count_n
    j += 1
  end

  k = n - 1
  while(k > 0)
    break if count_ones(k) == one_count_n
    k -= 1
  end

  [j,k]
end

def count_ones(n)
  count = 0
  while(n > 0)
    count += 1 if n%2 == 1
    n = n >> 1
  end

  count
end

def num_bits_to_flip(a,b)
  count = 0
  while(a > 0 || b > 0)
    y = a % 2
    x = b % 2
    count += 1 if x != y
    a = a >> 1
    b = b >> 1
  end

  count
end
