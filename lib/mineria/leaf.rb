module Mineria
  class Leaf
    attr_reader :klass
    def initialize(klass)
      @klass = klass
    end

    def is_leaf?
      true
    end

    def ==(other_leaf)
      @klass == other_leaf.klass
    end
  end
end