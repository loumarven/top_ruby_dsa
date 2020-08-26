class Node
  attr_accessor :data, :left, :right, :parent

  def initialize(data=nil)
    @data = data
    @left = nil
    @right = nil
    @parent = nil
  end

  def leaf?
    children_count == 0
  end

  def children_count
    count = 0

    count += 1 if self.left
    count += 1 if self.right

    count
  end

  def child
    self.left ? self.left : self.right
  end
end
