# encoding: UTF-8

class Graph
  attr_reader :graph

  def initialize
    @graph = {}
  end

  def add_node value
    @graph[value] = {
      edges: []
    }
  end

  def add_edge value_a, value_b
    unless @graph[value_a]
      add_node value_a
    end

    unless @graph[value_b]
      add_node value_b
    end

    @graph[value_a][:edges].push value_b
    @graph[value_b][:edges].push value_a
  end

  def remove_node value
    unless @graph[value]
      return false
    end

    @graph.delete value

    @graph.each_value do |nodes|
      nodes[:edges].each do |v|
        if v == value
          nodes[:edges].delete value
        end
      end
    end

    true
  end
end
