module Mineria
  class Node
    attr_reader :partition, :branches
    def initialize(partition, branches)
      @partition = partition
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