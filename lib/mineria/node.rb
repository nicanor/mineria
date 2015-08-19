module Mineria
  class Node
    attr_reader :attribute_name, :branches
    def initialize(attribute_name, branches)
      @attribute_name = attribute_name
      @branches = branches
    end

    def branch(condition)
      branches.detect {|branch| branch.condition == condition}
    end

    def is_leaf?
      false
    end
  end
end