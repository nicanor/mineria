# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Branch do
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

end