# encoding: UTF-8

require 'test/unit'
require_relative 'graph'

class GraphTest < Test::Unit::TestCase
  test 'add node' do
    g = Graph.new
    value = 'javascript'
    g.add_node value

    assert g.graph[value]
  end

  test 'add edge' do
    g = Graph.new
    value_a = 'javascript'
    value_b = 'ruby'

    g.add_edge(value_a, value_b)

    assert g.graph[value_b][:edges].include?(value_a)
    assert g.graph[value_a][:edges].include?(value_b)
  end

  test 'remove node' do
    g = Graph.new
    value_a = 'javascript'
    value_b = 'ruby'
    g.add_edge(value_a, value_b)

    assert g.remove_node value_a
    assert_equal nil, g.graph[value_a]
    assert_equal false, g.graph[value_b].include?(value_a)
  end

  test 'remove node when node does not exist' do
    g = Graph.new
    assert_equal false, g.remove_node('javascript')
  end
end
