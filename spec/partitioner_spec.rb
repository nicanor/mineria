# encoding: utf-8
require 'spec_helper'

module Mineria

  describe Partitioner do
    describe ".partition" do
      it "return branches for dataset" do
        partitioner = Partitioner.new(big_example)
        klass  = 'ambiente'

        sol_rows = [
          Row.new({'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'no'}, false),
          Row.new({'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'si'}, false),
          Row.new({'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'no'}, false),
          Row.new({'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'no'},  true),
          Row.new({'temperatura' => 'medi', 'humedad' => 'norm', 'viento' => 'si'},  true)
        ]

        nub_rows = [
          Row.new({'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'si'},  true),
          Row.new({'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'no'},  true),
          Row.new({'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'si'},  true),
          Row.new({'temperatura' => 'alta', 'humedad' => 'norm', 'viento' => 'no'},  true)
        ]

        llu_rows = [
          Row.new({'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'no'},  true),
          Row.new({'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'no'},  true),
          Row.new({'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'si'}, false),
          Row.new({'temperatura' => 'medi', 'humedad' => 'norm', 'viento' => 'no'},  true),
          Row.new({'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'si'}, false)
        ]

        result = {
          'sol' => sol_rows,
          'nub' => nub_rows,
          'llu' => llu_rows
        }

        expect(partitioner.call(klass)['sol']).to match_array(sol_rows)
        expect(partitioner.call(klass)['nub']).to match_array(nub_rows)
        expect(partitioner.call(klass)['llu']).to match_array(llu_rows)
      end
    end
  end

end