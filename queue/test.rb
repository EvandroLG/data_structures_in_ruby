# encoding: UTF-8

require 'test/unit'
require_relative 'queue'

class QueueTest < Test::Unit::TestCase
  test 'enqueue' do
    queue = Queue.new
    queue.enqueue 'javascript'

    assert_equal 1, queue.size
  end

  test 'dequeue' do
    queue = Queue.new
    queue.enqueue 'javascript'
    queue.enqueue 'ruby'

    assert_equal 'javascript', queue.dequeue
    assert_equal 1, queue.size

    queue.enqueue 'python'

    assert_equal 'ruby', queue.dequeue
    assert_equal 1, queue.size
  end

  test 'dequeue when queue is empty' do
    queue = Queue.new
    value = queue.dequeue

    assert_equal nil, value
    assert_equal 0, queue.size
  end

  test 'peek' do
    queue = Queue.new
    queue.enqueue 'javascript'
    queue.enqueue 'ruby'
    value = queue.peek

    assert_equal 'javascript', value
  end

  test 'peek when queue is empty' do
    queue = Queue.new
    value = queue.peek

    assert_equal nil, value
  end
end
