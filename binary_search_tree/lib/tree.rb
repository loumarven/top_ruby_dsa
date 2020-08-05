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
end
