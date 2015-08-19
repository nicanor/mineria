# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Leaf do
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

end