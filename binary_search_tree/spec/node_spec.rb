require 'node'

describe Node, "#data" do
  let(:node) { Node.new }

  context "when a node is initialized" do
    it "initialized the node data to nil" do
      expect(node).to be_truthy
      expect(node.data).to be_nil
    end

    it "returns the data the node was initialized with" do
      node = Node.new(50)

      expect(node).to be_truthy
      expect(node.data).to eq 50
    end
  end

  context "when the node data is later changed" do
    it "returns the new data assigned" do
      node.data = 60

      expect(node.data).to eq 60
    end
  end
end

describe Node, "#left" do
  let(:node) { Node.new }

  context "when a node is initialized" do
    it "initialized the left value to nil" do
      expect(node.left).to be_nil
    end
  end

  context "when the node's left value is later changed" do
    it "returns the new value assigned" do
      node.data = 50
      new_node = Node.new(40)
      node.left = new_node

      expect(node.left).to eq new_node
    end
  end
end

describe Node, "#left" do
  let(:node) { Node.new }

  context "when a node is initialized" do
    it "initialized the right value to nil" do
      expect(node.right).to be_nil
    end
  end

  context "when the node's right value is later changed" do
    it "returns the new value assigned" do
      node.data = 50
      new_node = Node.new(60)
      node.right = new_node

      expect(node.right).to eq new_node
    end
  end
end
