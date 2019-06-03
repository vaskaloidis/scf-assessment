require 'test/unit'
require "mocha/test_unit"
require "scf/api"
require "scf/cli"
require "json"

class TestCli < Test::Unit::TestCase

	def test_service_query
		raw_json =
			 {
			    "description": "a test desc",
			    "service_request_id": 12345,
			    "service_name": "s_name_testerooni"
			 }

		json = JSON.generate(raw_json)

		api = Scf::Api.new
		api.stubs(:services).returns(json)

		result = Scf::Cli.queryAccount(api, 29)

		expected_result = "description, service_request_id, service_name
a test desc, 12345, s_name_testerooni"

		assert_equal(expected_result, result)
	end

end