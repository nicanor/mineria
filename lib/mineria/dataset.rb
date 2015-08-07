module Mineria
  class Dataset
    attr_reader :data, :attributes
    def initialize(data, attributes)
      @data = data
      @attributes = attributes
    end

    def conditions(attribute)
      @attributes[attribute]
    end

    def attribute_names
      @attributes.keys
    end

    def klasses
      data.map &:klass
    end

    def one_klass?
      data.uniq.length == 1
    end

    def partitions(attribute_name)
      parts = {}
      conditions(attribute_name).each do |condition|
        parts[condition] = data.select{|row| row[attribute_name] == condition}
      end
      return parts
    end

    def entropy(attribute_name)
      1 #partitions(attribute_name)
      #partitions(attribute_name).map |key, rows|
      #  rows.
      #end
    end
  end
end