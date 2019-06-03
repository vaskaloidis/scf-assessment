require 'test/unit'
require "mocha/test_unit"
require "scf/api"

class TestApi < Test::Unit::TestCase
  def test_expected_services_response
    # Manually saved an API call to a file for this test
    # This test will fail when server data changes (obviously)
    file = File.join(File.dirname(__FILE__), '../api_mocks/account_query.json')
    expected = File.read(file)

    api = Scf::Api.new
    result = api.services(29)
    assert_equal(expected, result)
  end

  def test_invalid_organization_id
    # Manually saved an API call to a file for this test
    # This test will fail when server data changes (obviously)
    api = Scf::Api.new
    result = api.services(3000)

    expected_error = '[{"code":404,"description":"Invalid Organization ID","full_errors":null}]
"description, service_name, service_request_id"
Invalid Organization ID,,'
    
    assert_equal(expected_error, result)
  end

  def test_expected_geospatial_response
    # Manually saved an API call to a file for this test
    # This test will fail when server data changes (obviously)
    file = File.join(File.dirname(__FILE__), '../api_mocks/geospatial_query.json')
    expected = File.read(file)

    api = Scf::Api.new
    result = api.geospatial(41.307153,-72.925791)
    assert_equal(expected, result)
  end
end
