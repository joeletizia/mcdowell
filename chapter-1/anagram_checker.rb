class AnagramChecker
  def initialize(word)
    @word = word
    @character_count = word_to_hash
  end

  def anagram?(other)
    hash_for_other = {}

    other.split("").each do |letter|
      hash_for_other[letter] ||= 0
      hash_for_other[letter] += 1
    end

    hash_for_other == @character_count
  end

  attr_reader :word

  private

  def word_to_hash
    hash = {}
    word.split("").each do |letter|
      hash[letter] ||= 0
      hash[letter] += 1
    end

    hash
  end
end
