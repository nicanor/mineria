# encoding: utf-8
require 'spec_helper'

module Mineria

  describe DataLoader do
    describe ".call" do
      it "returns something awesome" do
        filename = File.join(File.dirname(__FILE__), '../data/weather.nominal.arff')
        file = ArffFile.load(filename)

        rows = [
          Row.new({'outlook' => 'sunny',    'temperature' => 'hot' , 'humidity' => 'high'  , 'windy' => 'FALSE'},'no'),
          Row.new({'outlook' => 'sunny',    'temperature' => 'hot' , 'humidity' => 'high'  , 'windy' => 'TRUE' },'no'),
          Row.new({'outlook' => 'overcast', 'temperature' => 'hot' , 'humidity' => 'high'  , 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'rainy',    'temperature' => 'mild', 'humidity' => 'high'  , 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'rainy',    'temperature' => 'cool', 'humidity' => 'normal', 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'rainy',    'temperature' => 'cool', 'humidity' => 'normal', 'windy' => 'TRUE' },'no'),
          Row.new({'outlook' => 'overcast', 'temperature' => 'cool', 'humidity' => 'normal', 'windy' => 'TRUE' },'yes'),
          Row.new({'outlook' => 'sunny',    'temperature' => 'mild', 'humidity' => 'high'  , 'windy' => 'FALSE'},'no'),
          Row.new({'outlook' => 'sunny',    'temperature' => 'cool', 'humidity' => 'normal', 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'rainy',    'temperature' => 'mild', 'humidity' => 'normal', 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'sunny',    'temperature' => 'mild', 'humidity' => 'normal', 'windy' => 'TRUE' },'yes'),
          Row.new({'outlook' => 'overcast', 'temperature' => 'mild', 'humidity' => 'high'  , 'windy' => 'TRUE' },'yes'),
          Row.new({'outlook' => 'overcast', 'temperature' => 'hot' , 'humidity' => 'normal', 'windy' => 'FALSE'},'yes'),
          Row.new({'outlook' => 'rainy',    'temperature' => 'mild', 'humidity' => 'high'  , 'windy' => 'TRUE' },'no')

        ]

        dataset = DataLoader.new(file).call
        expect(dataset).to be_a(Dataset)
        expect(dataset.attribute_names).to eq(['outlook', 'temperature', 'humidity', 'windy'])
        expect(dataset.attributes).to eq( {"outlook"=>["sunny", "overcast", "rainy"], "temperature"=>["hot", "mild", "cool"], "humidity"=>["high", "normal"], "windy"=>["TRUE", "FALSE"]})
        expect(dataset.data).to match_array(rows)
        #@relation = ''
        #@comment = []
        #@attribute_names = []
        #@attribute_types = Hash.new
        #@attribute_data = Hash.new
        #@data = []
        #@state = :comment
      end
    end
  end

end