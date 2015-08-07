# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Mineria::Leaf do
    describe ".klass" do
      it "return klass of leaf" do
        leaf = Leaf.new(true)
        expect(leaf.klass).to eq(true)
      end
    end

    describe ".is_leaf?" do
      it "return true since it is a leaf" do
        leaf = Leaf.new(true)
        expect(leaf.is_leaf?).to eq(true)
      end
    end
  end

  describe Mineria::Branch do
    describe ".condition" do
      it "returns condition of branch" do
        branch = Branch.new("condition", Leaf.new(true))
        expect(branch.condition).to eq("condition")
      end
    end

    describe ".condition" do
      it "returns condition of branch" do
        branch = Branch.new("condition", Leaf.new(true))
        expect(branch.condition).to eq("condition")
      end
    end
  end

  describe Mineria::Node do
    describe ".partition" do
      it "returns partition of node" do
        node = Node.new("partition", [])
        expect(node.partition).to eq("partition")
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