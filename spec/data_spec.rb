# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Mineria::Dataset do

    example   = [{'color' => 'green', 'class' => true}, {'color' => 'red', 'class' => false}]
    true_row  = Row.new({'color' => 'green'}, true)
    false_row = Row.new({'color' => 'red'}, false)
    klassy_example = [true_row, false_row]
    attributes = {'color' => ['green', 'red']}

    describe ".data" do
      it "return data of dataset" do
        dataset = Dataset.new([], {})
        expect(dataset.data).to eq([])
      end
    end

    describe ".attributes" do
      it "return attributes of dataset" do
        dataset = Dataset.new(example, attributes)
        expect(dataset.attributes).to eq(attributes)
      end
    end

    describe ".conditions" do
      it "return conditions for attribute" do
        dataset = Dataset.new(example, attributes)
        expect(dataset.conditions('color')).to eq(['green', 'red'])
      end
    end

    describe ".attributes_names" do
      it "return names of attributes" do
        dataset = Dataset.new(example, attributes)
        expect(dataset.attribute_names).to eq(['color'])
      end
    end

    describe ".klases" do
      it "return klases of data" do
        dataset = Dataset.new(klassy_example, attributes)
        expect(dataset.klasses).to eq([true, false])
      end
    end

    describe ".one_klass?" do
      it "should say false since there are two different klasses" do
        dataset = Dataset.new(klassy_example, attributes)
        expect(dataset.one_klass?).to eq(false)
      end

      it "should say true since there is only one klass" do
        dataset = Dataset.new([Row.new({'color' => 'green'}, true)], attributes)
        expect(dataset.one_klass?).to eq(true)
      end
    end

    describe ".partitions" do
      it "returns rows for each condition." do
        dataset = Dataset.new(klassy_example, attributes)
        expect(dataset.partitions('color')).to eq({'green' => [true_row], 'red' => [false_row]})
      end
    end

    describe ".entropy" do
      it "returns 1 since there are only two stuff." do
        dataset = Dataset.new(klassy_example, attributes)
        expect(dataset.entropy('color')).to eq(1)
      end
    end
  end

end