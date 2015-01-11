require 'spec_helper'
require_relative '../../chapter-1/1-2_reverse_string'

describe "c_style_reverse" do
  it "reverses the string" do
    expect(c_style_reverse("abcd#".split(""))).to eq("dcba#".split(""))
  end
end

describe "c_style_reverse_in_place" do
  it "reverses the string" do
    expect(c_style_reverse_in_place("abcd#".split(""))).to eq("dcba#".split(""))
    expect(c_style_reverse_in_place("abcde#".split(""))).to eq("edcba#".split(""))
  end
end
