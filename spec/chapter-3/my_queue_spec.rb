require 'spec_helper'
require_relative '../../chapter-3/my_queue'

describe MyQueue do
  describe "queue" do
    it "places the value given on the queue" do
      queue = MyQueue.new

      queue.enqueue(3)
      queue.enqueue(2)
      queue.enqueue(1)

      expect(queue.dequeue).to eq(3)
    end
  end
end
