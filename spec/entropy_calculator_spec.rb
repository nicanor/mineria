# encoding: utf-8
require 'spec_helper'

module Mineria

  describe EntropyCalculator do

    dataset = Dataset.new(
      [
        Row.new({'group' => 'a', 'kind' => 'A'}, true),
        Row.new({'group' => 'b', 'kind' => 'A'}, true),
        Row.new({'group' => 'a', 'kind' => 'B'}, true),
        Row.new({'group' => 'a', 'kind' => 'B'}, false),
        Row.new({'group' => 'b', 'kind' => 'B'}, false)
      ],
      {'group' => ['a','b'], 'kind' => ['A','B']}
    )

    describe ".counter" do
      it "return counter of true and false clases of conditions of attributes" do
        result = {
          'group' => {
            'a' => [2,1],
            'b' => [1,1]
          },
          'kind' => {            
            'A' => [2,0],
            'B' => [1,2]
          }
        }
        partitioner = EntropyCalculator.new(dataset)
        expect(partitioner.counter).to eq(result)
      end
    end

    describe ".max_entropy" do
      it "return entropy of every attribute" do       
        partitioner = EntropyCalculator.new(dataset)
        expect(partitioner.max_entropy).to eq('kind')
      end
    end

  end
end