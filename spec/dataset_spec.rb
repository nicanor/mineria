# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Dataset do

    example   = [{'color' => 'green', 'class' => true}, {'color' => 'red', 'class' => false}]
    true_row  = Row.new({'color' => 'green'}, true)
    false_row = Row.new({'color' => 'red'}, false)
    klassy_example = [true_row, false_row]
    attributes = {'color' => ['green', 'red']}

    attributes_2 = {'letter' => ['x', 'y']}

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

      it "works for big examples" do
        expect(big_example.attribute_names).to eq(['ambiente','temperatura','humedad','viento'])
      end
    end

    describe ".klasses" do
      it "return klasses of data" do
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

    describe ".part" do
      it "should return leaf if same class" do
        dataset = Dataset.new([Row.new({'color' => 'green'}, true)], attributes)
        expect(dataset.part).to eq(Leaf.new(true))
      end

      it "should return false leaf if same class" do
        dataset = Dataset.new([Row.new({'color' => 'green'}, false)], attributes)
        expect(dataset.part).to eq(Leaf.new(false))
      end

      it "should return node with branches if different class" do
        dataset_1 = Dataset.new([Row.new({'color' => 'green'}, true), Row.new({'color' => 'red'}, false)], attributes)
        dataset_2 = Dataset.new([Row.new({'letter' => 'x'}, true), Row.new({'letter' => 'y'}, false)], attributes_2)

        node_1 = dataset_1.part
        node_2 = dataset_2.part

        expect(node_1).to be_a(Node)
        expect(node_2).to be_a(Node)

        expect(node_1.attribute_name).to eq('color')
        expect(node_2.attribute_name).to eq('letter')

        expect(node_1.branch('green')).to be_a(Branch)
        expect(node_1.branch('green').tree).to be_a(Leaf)
        expect(node_1.branch('green').tree.klass).to eq(true)
        expect(node_1.branch('red')).to be_a(Branch)
        expect(node_1.branch('red').tree).to be_a(Leaf)
        expect(node_1.branch('red').tree.klass).to eq(false)
      end
    end
  end

end