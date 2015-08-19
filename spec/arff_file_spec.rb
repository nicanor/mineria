# encoding: utf-8
require 'spec_helper'

module Mineria

  describe ArffFile do
    describe ".load" do
      it "returns something awesome" do
        filename = File.join(File.dirname(__FILE__), '../data/weather.nominal.arff')
        file = ArffFile.load(filename)
        #puts '11111111111111111111111'
        #puts '22222222222222222222222'
        #puts '33333333333333333333333'
        #puts file.data
  
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