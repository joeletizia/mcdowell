require 'spec_helper'
require_relative '../../chapter-1/1-2_reverse_string'

describe "c_style_reverse" do
  it "reverses the string" do
    expect(c_style_reverse("abcd#".split(""))).to eq("dcba#".split(""))
  end
end
