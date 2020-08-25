class Tree
  attr_reader :root

  def initialize(array)
    @parent = nil
    @root = build_tree(array.uniq.sort)
  end

  # turn nodes into a balanced tree
  # return root node
  def build_tree(array)
    return nil if array.empty?

    mid = (array.length - 1) / 2
    root = Node.new(array[mid])

    # TODO: is there a better way to track a node's parent?
    root.parent = parent
    @parent = root

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
    # TODO: handle case where value is not found in tree
    node = find(value)
    if node.leaf?
      remove_leaf(node)
    else
      # TODO: support cases for 1 child and 2 children
    end
  end

  private
  attr_reader :parent # used to track a node's parent

  def remove_leaf(node)
    # identify if node is left or right child of parent
    # set node's parent left/right value to nil
    if node == node.parent.left
      node.parent.left = nil
    else
      node.parent.right = nil
    end
  end
end
