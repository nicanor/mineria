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
      klasses.uniq.length == 1
    end

    def part
      if one_klass?
        Leaf.new(klasses.first)
      else
        calculator  = EntropyCalculator.new(self)
        partitioner = Partitioner.new(self)
        attribute_name = calculator.max_entropy
        partitions = partitioner.call(attribute_name)
        new_attributes = @attributes.tap { |hs| hs.delete(attribute_name) }
        branches = partitions.map do |condition_name, rows|
          new_dataset = Dataset.new(rows, new_attributes)
          Branch.new(condition_name, new_dataset.part)
        end
        Node.new(attribute_name, branches)
      end
    end

  end
end