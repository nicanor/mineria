module Mineria
  class Branch
    attr_reader :condition, :tree
    def initialize(condition, tree)
      @condition = condition
      @tree = tree
    end
  end
end