# encoding: UTF-8

require 'test/unit'
require_relative 'doubly_linked_list'

class DoublyLinkedListTest < Test::Unit::TestCase
  test 'add last' do
    linked_list = DoublyLinkedList.new
    linked_list.add_last 'javascript'
    linked_list.add_last 'python'
    linked_list.add_last 'ruby'

    assert_equal 'ruby', linked_list.item(2)
    assert_equal 'python', linked_list.item(1)
    assert_equal 'javascript', linked_list.item(0)
  end

  test 'add first' do
    linked_list = DoublyLinkedList.new
    linked_list.add_first 'javascript'
    linked_list.add_first 'python'
    linked_list.add_first 'ruby'

    assert_equal 'ruby', linked_list.item(0)
    assert_equal 'python', linked_list.item(1)
    assert_equal 'javascript', linked_list.item(2)
  end

  test 'remove by index' do
    linked_list = DoublyLinkedList.new
    linked_list.add_first 'javascript'
    linked_list.add_first 'python'
    linked_list.add_first 'ruby'

    assert linked_list.remove_by_index(1)
    assert_equal 2, linked_list.size
    assert_equal 'javascript', linked_list.item(1)
    assert_equal 'ruby', linked_list.item(0)
    assert_equal nil, linked_list.item(2)
  end

  test 'remove by data' do
    linked_list = DoublyLinkedList.new
    linked_list.add_first 'javascript'
    linked_list.add_first 'python'
    linked_list.add_first 'ruby'

    assert linked_list.remove_by_data('python')
    assert_equal 2, linked_list.size
    assert_equal 'javascript', linked_list.item(1)
    assert_equal 'ruby', linked_list.item(0)
    assert_equal nil, linked_list.item(2)
  end
end
