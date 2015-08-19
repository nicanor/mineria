require 'mineria'

def big_example
  Mineria::Dataset.new(
    [
      Mineria::Row.new({'ambiente' => 'sol', 'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'no'}, false),
      Mineria::Row.new({'ambiente' => 'sol', 'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'si'}, false),
      Mineria::Row.new({'ambiente' => 'nub', 'temperatura' => 'alta', 'humedad' => 'alta', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'llu', 'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'llu', 'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'llu', 'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'si'}, false),
      Mineria::Row.new({'ambiente' => 'nub', 'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'si'},  true),
      Mineria::Row.new({'ambiente' => 'sol', 'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'no'}, false),
      Mineria::Row.new({'ambiente' => 'sol', 'temperatura' => 'baja', 'humedad' => 'norm', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'llu', 'temperatura' => 'medi', 'humedad' => 'norm', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'sol', 'temperatura' => 'medi', 'humedad' => 'norm', 'viento' => 'si'},  true),
      Mineria::Row.new({'ambiente' => 'nub', 'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'si'},  true),
      Mineria::Row.new({'ambiente' => 'nub', 'temperatura' => 'alta', 'humedad' => 'norm', 'viento' => 'no'},  true),
      Mineria::Row.new({'ambiente' => 'llu', 'temperatura' => 'medi', 'humedad' => 'alta', 'viento' => 'si'}, false)
    ],
    {
      'ambiente'    => ['sol', 'nub', 'llu'],
      'temperatura' => ['alta', 'medi', 'baja'],
      'humedad'     => ['alta', 'norm'],
      'viento'      => ['si', 'no']      
    }
  )
end