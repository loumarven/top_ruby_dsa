require 'tree'

describe Tree, "#build_tree" do
  it "builds the tree correctly and returns the root node" do
    tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
    # resulting tree:
    # 
    #       8
    #    /     \
    #   4        67
    #  / \      /  \
    # 1   5    9   324
    #  \   \    \    \
    #   3   7    23   6345 

    expect(tree.root.data).to eq(8)
    expect(tree.root.left.data).to eq(4)
    expect(tree.root.right.data).to eq(67)

    l1_left = tree.root.left
    expect(l1_left.left.data).to eq(1)
    expect(l1_left.right.data).to eq(5)

    l2_left_left = l1_left.left
    expect(l2_left_left.right.data).to eq(3)

    l2_left_right = l1_left.right
    expect(l2_left_right.right.data).to eq(7)

    l1_right = tree.root.right
    expect(l1_right.left.data).to eq(9)
    expect(l1_right.right.data).to eq(324)

    l2_right_left = l1_right.left
    expect(l2_right_left.right.data).to eq(23)

    l2_right_right = l1_right.right
    expect(l2_right_right.right.data).to eq(6345)
  end
end
