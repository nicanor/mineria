module Mineria
  class DataLoader
    def initialize(file)
      @file = file
    end

    def call
      Dataset.new(rows, attributes)
    end

    def attributes
      @file.attribute_data.delete_if {|k,v| k == class_name }
    end

    def class_name
      @file.attribute_names[-1]
    end

    def rows
      @file.data.map do |array|
        Row.new attributes.keys.zip(array[0..-2]).to_h, array[-1]
      end
    end
  end
end