# encoding: utf-8
require 'spec_helper'

module Mineria
  describe Row do
    describe ".klass" do
      it "return klass of row" do
        row  = Row.new({'color' => 'green'}, true)
        expect(row.klass).to eq(true)
      end

      it "return klass of row" do
        row = Row.new({'color' => 'red'}, false)
        expect(row.klass).to eq(false)
      end
    end

    describe ".brackets" do
      it "return attributes" do
        row = Row.new({'color' => 'green'}, true)
        expect(row['color']).to eq('green')
      end
    end

    describe ".without" do
      it "returns row without attribute" do
        row = Row.new({'color' => 'green'}, true)
        expect(row.without('color')).to eq(Row.new({}, true))
      end
    end

    describe ".equals" do
      it "returns true" do
        expect(Row.new({'color' => 'green'}, true)).to eq(Row.new({'color' => 'green'}, true))
      end
    end
  end
end