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
      if node.nil? || value == node.data
        break
      elsif  value < node.data
        # TODO: move parent tracking somewhere else
        temp = node
        node = node.left
        node.parent = temp unless node.nil?
      elsif value > node.data
        # TODO: move parent tracking somewhere else
        temp = node
        node = node.right
        node.parent = temp unless node.nil?
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
      children = node.children_count
      if children == 1
        # copy child to node
        # delete node
        remove_node_one_child(node)
      else # 2
      end
    end
  end

  private
  def remove_leaf(node)
    # identify if node is left or right child of parent
    # set node's parent left/right value to nil
    if node == node.parent.left
      node.parent.left = nil
    else
      node.parent.right = nil
    end
  end

  def remove_node_one_child(node)
    if node == node.parent.left
      node.parent.left = node.child
      node = nil
    else
      node.parent.right = node.child
      node = nil
    end
  end
end
