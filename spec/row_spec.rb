# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Mineria::Row do
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
  end
end