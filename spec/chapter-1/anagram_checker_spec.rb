require 'spec_helper'
require_relative '../../chapter-1/anagram_checker'

describe AnagramChecker do
  subject(:checker) { AnagramChecker.new(word) }

  describe "#anagram?" do
    let(:word) { "dog" }

    it "returns true if the word is an anagram of another" do
      expect(checker.anagram?("god")).to eq(true)
    end

    it "returns false if the word is not an anagram of another" do
      expect(checker.anagram?("butt")).to eq(false)
    end
  end
end
