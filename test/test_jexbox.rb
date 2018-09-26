require 'helper'

class TestJexbox < MiniTest::Test
  def test_dummy
    Jexbox.configure do |config|
      config.api_key = '3d3fb8210d54222ae55c81358ab3a96ea38c4f9e'
      config.uri = 'http://localhost:8080/api/notify'
      config.enabled = true
    end

    Jexbox.notify(Exception.new('test'))

  end
end
