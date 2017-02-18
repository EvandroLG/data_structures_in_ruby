require 'test/unit'
require_relative 'singly_linked_list'

class SinglyLinkedListTest < Test::Unit::TestCase
  test 'add datas at end of list' do
    linked_list = SinglyLinkedList.new 
    linked_list.add_last 'javascript'
    linked_list.add_last 'python'
    linked_list.add_last 'ruby'

    assert_equal 'javascript', linked_list.item(0)
    assert_equal 'python', linked_list.item(1)
    assert_equal 'ruby', linked_list.item(2)
  end

  test 'add datas at start of list' do
    linked_list = SinglyLinkedList.new 
    linked_list.add_first 'javascript'
    linked_list.add_first 'python'
    linked_list.add_first 'ruby'

    assert_equal 'javascript', linked_list.item(2)
    assert_equal 'python', linked_list.item(1)
    assert_equal 'ruby', linked_list.item(0)
  end

  test 'return false when user try to find by an invalid index' do
    linked_list = SinglyLinkedList.new 
    assert !linked_list.item(1)
    assert !linked_list.item(-1)
  end

  test 'remove data by index' do
    linked_list = SinglyLinkedList.new 
    linked_list.add_first 'javascript'
    linked_list.add_first 'python'
    linked_list.add_first 'ruby'

    assert linked_list.remove_by_index(1)
    assert_equal 2, linked_list.size
    assert_equal 'javascript', linked_list.item(1)
    assert_equal 'ruby', linked_list.item(0)
    assert_equal nil, linked_list.item(2)
  end

  test 'return false when user try to remove a data with an invalid index' do
    linked_list = SinglyLinkedList.new 
    assert !linked_list.remove_by_index(1)
    assert !linked_list.remove_by_index(-1)
  end
end
