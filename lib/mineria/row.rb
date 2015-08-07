module Mineria
  class Row
    attr_reader :klass
    def initialize(attributes, klass)
      @attributes = attributes
      @klass = klass
    end

    def klass?
      @klass
    end

    def [](attribute_name)
      @attributes[attribute_name]
    end
  end
end