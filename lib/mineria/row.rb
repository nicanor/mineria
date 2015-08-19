module Mineria
  class Row
    attr_reader :klass, :attributes
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

    def without(attribute_name)
      new_attributes = @attributes.select{|k,v| k != attribute_name}
      Row.new(new_attributes, @klass)
    end

    def ==(other_row)
      @attributes == other_row.attributes && @klass == other_row.klass
    end 
  end
end