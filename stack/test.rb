# encoding: UTF-8

require 'test/unit'
require_relative 'stack'

class StackTest < Test::Unit::TestCase
  test 'push' do
    stack = Stack.new
    stack.push 'javascript'
    value = stack.push 'python'

    assert_equal 2, stack.size
    assert_equal 'python', value
  end

  test 'pop' do
    stack = Stack.new
    stack.push 'javascript'
    value = stack.pop

    assert_equal 0, stack.size
    assert_equal 'javascript', value
  end

  test 'pop when stack is empty' do
    stack = Stack.new
    value = stack.pop

    assert_equal 0, stack.size
    assert_equal nil, value
  end

  test 'peek' do
    stack = Stack.new
    stack.push 'python'
    stack.push 'javascript'

    assert_equal 'javascript', stack.peek
  end

  test 'peek when stack is empty' do
    stack = Stack.new
    assert_equal nil, stack.peek
  end
end
