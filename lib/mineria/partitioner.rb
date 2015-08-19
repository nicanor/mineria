module Mineria
  class Partitioner

    def initialize(dataset)
      @dataset = dataset
    end

    def call(attribute_name)
      partitions = @dataset.conditions(attribute_name).map{|c| [c, []]}.to_h
      @dataset.data.each do |row|
        partitions[row[attribute_name]] << row.without(attribute_name)
      end
      return partitions
    end
  end
end