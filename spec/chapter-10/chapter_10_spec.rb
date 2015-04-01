require 'spec_helper'
require_relative '../../chapter-10/chapter_10'

describe "#find_dupes" do
  it "finds dupes in the array" do
    array = (1...32000).to_a + [3324]
    expect(find_dupes(array)).to include(3324)
    expect(find_dupes(array)).to_not include(3323)
  end
end
