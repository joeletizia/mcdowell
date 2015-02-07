require 'spec_helper'
require_relative '../../chapter-1/1-3_duplicate_chars_in_string'

describe "duplicate_chars_in_string" do
  it "removes the second instance of any repeated chars" do
    expect(remove_dupes("aa")).to eq("a")
    expect(remove_dupes("aba")).to eq("ab")
    expect(remove_dupes("abab")).to eq("ab")
  end
end
