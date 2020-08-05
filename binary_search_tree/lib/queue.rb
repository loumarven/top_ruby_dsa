class Queue
  attr_reader :list

  def initialize
    @list = []
  end

  def enqueue(node)
    list.push(node)
  end

  def dequeue
    list.shift
  end

  def empty?
    list.length == 0
  end
end
