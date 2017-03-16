# encoding: UTF-8

class DoublyLinkedList
  attr_reader :size

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  private
  def create_node data
    {
      data: data,
      node_next: nil,
      node_prev: nil
    }
  end

  public
  def add_last data
    node = create_node data
    @size = @size + 1

    unless @head
      @head = node
    else
      node[:node_prev] = @tail
      @tail[:node_next] = node
    end

    @tail = node
  end

  def add_first data
    node = create_node data
    @size = @size + 1

    unless @head
      @head = node
      @tail = node
    else
      node[:node_next] = @head
      @head[:node_prev] = node
      @head = node
    end
  end

  def item index
    if index < 0 || index >= @size
      return
    end

    current = @head
    i = 0

    while index > i do
      current = current[:node_next]
      i = i + 1
    end

    current[:data]
  end

  def remove_by_index index
    if index < 0 || index >= @size 
      return false
    end

    current = @head
    i = 0

    if index == 0
      @head = current[:node_next]

      unless @head
        @tail = nil
      else
        @head[:node_prev] = nil
      end
    else
      while i < index do
        current = current[:node_next]
        i = i + 1
      end

      current[:node_prev][:node_next] = current[:node_next]
      current[:node_next][:node_prev] = current[:node_prev]
    end

    @size = @size - 1
    true
  end

  def remove_by_data data
    unless @head then return false end

    if @head[:data] == data
      @size = @size - 1
      @head = @head[:node_next]

      return true
    end

    current = @head

    while current = current[:node_next] do
      if current[:data] == data 
        @size = @size - 1
        current[:node_prev][:node_next] = current[:node_next]
        current[:node_next][:node_prev] = current[:node_prev]

        return true
      end
    end

    false
  end
end
