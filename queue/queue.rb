# encoding: UTF-8

class Queue
  attr_reader :size

  def initialize
    @size = 0
    @head = 0
    @store = {}
  end

  public
  def enqueue value
    @store[@size] = value
    @size = @size + 1

    value
  end

  def dequeue
    if @size == 0
      return
    end

    value = @store.delete[@head]
    @size = @size - 1
    @head = @head + 1

    value
  end

  def peek
    if @size == 0
      return
    end

    @store.delete[@head]
  end
end
