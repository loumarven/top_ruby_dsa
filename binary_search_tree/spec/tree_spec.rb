require 'tree'

describe Tree, "#build_tree" do
  it "builds the tree correctly and returns the root node" do
    tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
    # resulting tree:
    # 
    #         8
    #      /     \
    #     4        67
    #    / \      /  \
    #   1   5    9   324
    #    \   \    \    \
    #     3   7    23   6345 

    expect(tree.root.data).to eq(8)
    expect(tree.root.left.data).to eq(4)
    expect(tree.root.right.data).to eq(67)

    l2_left = tree.root.left
    expect(l2_left.left.data).to eq(1)
    expect(l2_left.right.data).to eq(5)

    l3_left_left = l2_left.left
    expect(l3_left_left.right.data).to eq(3)

    l3_left_right = l2_left.right
    expect(l3_left_right.right.data).to eq(7)

    l2_right = tree.root.right
    expect(l2_right.left.data).to eq(9)
    expect(l2_right.right.data).to eq(324)

    l3_right_left = l2_right.left
    expect(l3_right_left.right.data).to eq(23)

    l3_right_right = l2_right.right
    expect(l3_right_right.right.data).to eq(6345)
  end
end

describe Tree, "#insert" do
  let(:tree) { Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) }

  context "when value being inserted is greater than root node" do
    it "inserts the value to the right subtree leaf node" do
      tree.insert(50)

      # resulting tree:
      # 
      #         8
      #      /     \
      #     4        67
      #    / \      /  \
      #   1   5    9   324
      #    \   \    \    \
      #      3   7    23   6345 
      #                \
      #                 50

      parent_node = tree.root.right.left.right
      expect(parent_node.data).to eq(23)
      expect(parent_node.right.data).to eq(50)
    end
  end

  context "when value being inserted is less than root node" do
    it "inserts the value to the left subtree leaf node" do
      tree.insert(0)

      # resulting tree:
      # 
      #         8
      #      /     \
      #     4        67
      #    / \      /  \
      #   1   5    9   324
      #  / \   \    \    \
      # 0   3   7    23   6345 
      #               \
      #                50

      parent_node = tree.root.left.left
      expect(parent_node.data).to eq(1)
      expect(parent_node.left.data).to eq(0)
    end
  end
end

describe Tree, "#delete" do
  let(:tree) { Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) }
  #         8
  #      /     \
  #     4        67
  #    / \      /  \
  #   1   5    9   324
  #    \   \    \    \
  #     3   7    23   6345 

  context "node to be deleted is a leaf node" do
    it "deletes the node from the tree" do
      node = tree.find(6345)
      parent = node.parent
      expect(parent.data).to eq(324)

      tree.delete(6345)
      # resulting tree:
      # 
      #         8
      #      /     \
      #     4        67
      #    / \      /  \
      #   1   5    9   324
      #    \   \    \
      #     3   7    23 
      expect(parent.right).to be_nil
    end
  end

  context "node to be deleted has one child" do
    it "copies the node's child and delete's the node" do
      node = tree.find(5)
      parent = node.parent
      expect(parent.data).to eq(4)

      tree.delete(5)
      # resulting tree:
      #         8
      #      /     \
      #     4        67
      #    / \      /  \
      #   1   7    9   324
      #    \        \    \
      #     3        23   6345
      expect(parent.right.data).to eq(7)
    end
  end
end

describe Tree, "#find" do
  let(:tree) { Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) }
  #         8
  #      /     \
  #     4        67
  #    / \      /  \
  #   1   5    9   324
  #    \   \    \    \
  #     3   7    23   6345 

  context "when the given value is in the tree" do
    it "returns the node holding the given value" do
      node = tree.find(9)
      expect(node).to be_truthy
      expect(node.data).to eq(9)
      expect(node.right.data).to eq(23)
    end
  end

  context "when the given value is not in the tree" do
    it "returns nil" do
      node = tree.find(80)
      expect(node).to be_nil
    end
  end
end
