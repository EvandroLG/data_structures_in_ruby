# encoding: UTF-8

require 'test/unit'
require_relative 'binary_search_tree'

class BinarySearchTreeTest < Test::Unit::TestCase
  test 'insert' do
    bst = BinarySearchTree.new

    assert bst.insert(10)
    assert bst.insert(5)
    assert bst.insert(15)
  end

  test 'root?' do
    bst = BinarySearchTree.new
    value = 10
    bst.insert value

    assert bst.root?(value)
    assert_equal false, bst.root?(20)
  end

  test 'contains?' do
    bst = BinarySearchTree.new
    bst.insert 10
    bst.insert 5
    bst.insert 15

    assert bst.contains?(10)
    assert bst.contains?(5)
    assert bst.contains?(15)
    assert_equal false, bst.contains?(20)
  end

  test 'height' do
    bst = BinarySearchTree.new

    assert_equal 0, bst.height

    bst.insert 10
    bst.insert 5
    bst.insert 15

    assert_equal 1, bst.height

    bst.insert 20
    bst.insert 25
    bst.insert 10

    assert_equal 3, bst.height
  end
end
