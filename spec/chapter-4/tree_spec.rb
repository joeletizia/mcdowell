require 'spec_helper'
require_relative '../../chapter-4/tree'

describe Tree do
  subject(:tree) { Tree.new }

  describe "#root" do
    context "when the tree has no nodes" do
      it "returns null" do
        expect(subject.root).to eq(nil)
      end
    end

    context "when the tree has nodes" do
      it "returns the root node" do
        subject.insert(4)
        expect(subject.root.value).to eq(4)
      end
    end
  end
end
