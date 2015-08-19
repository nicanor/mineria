module Mineria
  class EntropyCalculator

    def initialize(dataset)
      @dataset = dataset
    end

    def initial_counter
      h = @dataset.attributes.dup
      h.update(h) do |k,vs|
        vs.map{|v| [v, [0,0]]}.to_h
      end
    end

    def counter
      h = initial_counter
      @dataset.data.each do |row|
        @dataset.attribute_names.each do |attribute_name|
          if row.klass
            h[attribute_name][row[attribute_name]][0] += 1
          else
            h[attribute_name][row[attribute_name]][1] += 1
          end
        end
      end
      return h
    end

    def mini_entropy(klasses_counts)
      total = klasses_counts.reduce(&:+).to_f
      - klasses_counts.map do |count|
        x = count.zero? ? 1 : count/total
        x*Math.log2(x)
      end.reduce(&:+)
    end

    def attribute_entropy(attribute_counts)
      total = attribute_counts.map {|k,v| v.reduce(&:+)}.reduce(&:+).to_f
      attribute_counts.map do |key, value|
        value.reduce(&:+)/total * mini_entropy(value)
      end.reduce(&:+)
    end

    def max_entropy
      c = counter
      @dataset.attribute_names.max{|name| attribute_entropy(c[name])}
    end
  end
end