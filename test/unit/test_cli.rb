require 'test/unit'
require "mocha/test_unit"
require "scf/api"
require "scf/cli"
require "json"

class TestCli < Test::Unit::TestCase

	TEST_DATA =
		 [{
				 "description":        "a test desc",
				 "address":            "84 Osborn Avenue  New Haven, Connecticut",
				 "lat":                41.323941,
				 "service_request_id": 12345,
				 "requested_datetime": "2014-09-24T14:10:40-04:00",
				 "long":               -72.951125,
				 "service_code":       1249,
				 "status":             "open",
				 "zipcode":            "06515",
				 "updated_datetime":   "2018-09-29T00:04:04-04:00",
				 "agency_responsible": "City of New Haven",
				 "service_name":       "Public Space, Streets and Drains",
				 "media_url":          nil,
				 "expected_datetime":  nil,
				 "address_id":         nil,
				 "service_notice":     nil,
				 "status_notes":       nil
		  }]

	def test_service_query_default_params
		json = JSON.generate(TEST_DATA)

		api = Scf::Api.new
		api.stubs(:services).returns(JSON.parse(json))

		result = Scf::Cli.queryAccount(api, 29, Scf::Cli::DEFAULT_PARAMS)

		expected_result = "description,service_name,service_request_id
a test desc,\"Public Space, Streets and Drains\",12345\n"

		assert_equal(expected_result, result.force_encoding('UTF-8'))
	end

	def test_service_query_custom_params
		json = JSON.generate(TEST_DATA)

		api = Scf::Api.new
		api.stubs(:services).returns(JSON.parse(json))

		result = Scf::Cli.queryAccount(api, 29, ["status", "agency_responsible", "service_request_id"])

		expected_result = "status,agency_responsible,service_request_id
open,City of New Haven,12345\n"

		assert_equal(expected_result, result.force_encoding('UTF-8'))
	end

end