# encoding: UTF-8

class SinglyLinkedList
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
      node_next: nil
    }
  end

  public
  def add_last data
    node = create_node data
    @size = @size + 1

    unless @head
      @head = node
    else
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
      @head = node
    end
  end

  def item index
    if index < 0 || index >= @size
      return
    end

    current = @head
    i = 0

    while i < index do
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

    if index == 0
      @head = current[:node_next]

      unless @head
        @tail = nil
      end

    elsif index == (@size - 1)
      previous = @head 

      while previous[:node_next] != @tail do
        previous = previous[:node_next]
      end

      @tail = previous
      @tail[:node_next] = nil
    else
      i = 0

      while i < (index-1) do
        current = current[:node_next]
        i = i + 1
      end

      current[:node_next] = current[:node_next][:node_next]
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

    while current[:node_next] do
      if current[:node_next][:data] == data
        @size = @size - 1
        current[:node_next] = current[:node_next][:node_next]
        return true
      end
    end

    false
  end

  def remove_tail
    if @size == 0
      return false
    end

    current_node = @head

    while current_node[:node_next] != @tail do
      current_node = current_node[:node_next]
    end

    current_node[:node_next] = nil
    @tail = current_node
    @size = @size - 1

    true
  end
end
