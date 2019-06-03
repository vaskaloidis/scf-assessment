require 'test/unit'
require "mocha/test_unit"
require "scf/api"

class TestApi < Test::Unit::TestCase
  def test_expected_data
    # Manually saved an API call to a file for this test
    # This test will fail when server data changes (obviously)
    expected = File.read("./data/services.json")

    api = Scf::Api.new
    result = api.services(29)
    assert_equal (result expected)
  end
end
