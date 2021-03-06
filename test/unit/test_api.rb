require 'test/unit'
require "mocha/test_unit"
require "scf/api"

class TestApi < Test::Unit::TestCase
	def test_expected_services_response
		# This test will fail when server data changes (obviously)
		file     = File.join(File.dirname(__FILE__), '../test_data/json_mocks/account_29_query.json')
		expected = File.read(file)

		api    = Scf::Api.new
		result = api.services(29)
		assert_equal(JSON.parse(expected), result)
	end

	def test_invalid_account_id
		api    = Scf::Api.new
		result = api.services(3000)

		assert_false(result)
	end

	def test_expected_geospatial_response
		file     = File.join(File.dirname(__FILE__), '../test_data/json_mocks/geospatial_query_2.json')
		expected = File.read(file)

		api    = Scf::Api.new
		result = api.geospatial(41.307153, -72.925791)
		assert_equal(JSON.parse(expected), result)
	end

end
