# encoding: UTF-8

class BinarySearchTree
  def initialize
    @root = nil
  end

  private
  def create_node value
    {
      value: value,
      left: nil,
      right: nil
    }
  end

  def find_lca root, value_a, value_b
    if root[:value] > value_a && root[:value] > value_b
      return find_lca root[:left], value_a, value_b
    elsif root[:value] < value_a && root[:value] < value_b
      return find_lca root[:right], value_a, value_b
    end

    root
  end

  def find_height root
    unless root
      return -1
    end

    1 + [find_height(root[:left]), find_height(root[:right])].max
  end

  public
  def insert value
    node = create_node value

    unless @root
      @root = node
      return true 
    end

    current = @root

    loop do
      if value < current[:value]
        if !current[:left]
          current[:left] = node
          return true
        end

        current = current[:left]
      elsif value > current[:value]
        if !current[:right]
          current[:right] = node
          return true
        end

        current = current[:right]
      else
        return false
      end
    end
  end

  def root? value
    unless @root
      return false
    end

    @root[:value] == value
  end

  def contains? value
    found = false
    current = @root

    while !found && current do
      if value < current[:value]
        current = current[:left]
      elsif value > current[:value]
        current = current[:right]
      else
        found = true
      end
    end

    found
  end

  def height
    unless @root
      return 0
    end

    find_height @root
  end

  def lca value_a, value_b
    unless @root
      return nil
    end

    find_lca @root, value_a, value_b
  end
end
