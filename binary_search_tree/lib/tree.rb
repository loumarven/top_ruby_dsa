class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  # turn nodes into a balanced tree
  # return root node
  def build_tree(array)
    return nil if array.empty?

    mid = (array.length - 1) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1..-1])

    root
  end

  def insert(value)
    node = @root
    reached_leaf_node = false

    until reached_leaf_node do
      if value < node.data
        if node.left.nil?
          reached_leaf_node = true
          node.left = Node.new(value)
        else
          node = node.left
        end
      elsif value > node.data
        if node.right.nil?
          reached_leaf_node = true
          node.right = Node.new(value)
        else
          node = node.right
        end
      end
    end # loop
  end

  # returns node holding the given value
  def find(value)
    queue = Queue.new
    queue.enqueue(root)

    until queue.empty? do
      node = queue.dequeue

      if node.data == value
        return node
      else
        queue.enqueue(node.left) if node.left
        queue.enqueue(node.right) if node.right
      end
    end

    nil # not found
  end
end
