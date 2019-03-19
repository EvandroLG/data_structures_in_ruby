# encoding: UTF-8

class Stack
  attr_reader :size

  def initialize
    @size = 0
    @store = {}
  end

  public
  def push value
    @store[@size] = value
    @size = @size + 1

    value
  end

  def pop
    if @size == 0
      return
    end

    value = @store.delete(@size - 1)
    @size = @size - 1

    value
  end

  def peek
    @store.delete(@size - 1)
  end
end
