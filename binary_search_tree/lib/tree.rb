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
    node = root

    loop do
      break if node.nil?

      if value == node.data
        break
      elsif  value < node.data
        node = node.left
      elsif value > node.data
        node = node.right
      end
    end

    node
  end

  def delete(value)
    # 1. find value in tree
    # 2. if leaf node, simply delete the node from tree

    # assume value is in tree
    node = find(value)
    if leaf?(node)
      
    else
    end
  end

  private
  def leaf?(node)
    childrent_count(node) == 0
  end

  def children_count(node)
    count = 0

    count += 1 if node.left
    count += 1 if node.right

    count
  end
end
