# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Node do
    describe ".attribute_name" do
      it "returns attribute name for partition of node" do
        node = Node.new("attribute_name", [])
        expect(node.attribute_name).to eq("attribute_name")
      end
    end

    describe ".branches" do
      it "returns branches of node" do
        branches = [Branch.new("izq", Leaf.new(true)), Branch.new("der", Leaf.new(true))]
        node = Node.new("partition", branches)
        expect(node.branches).to eq(branches)
      end
    end

    describe ".branch" do
      it "returns branch wich match condition" do
        branches = [Branch.new("izq", Leaf.new(true)), Branch.new("der", Leaf.new(true))]
        node = Node.new("partition", branches)
        expect(node.branch('izq')).to eq(branches.first)
      end
    end

    describe ".is_leaf?" do
      it "return false since it is a node" do
        node = Node.new("partition", [])
        expect(node.is_leaf?).to eq(false)
      end
    end
  end

end