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

	def test_geocoordinate_custom_params
		expected_result = File.read(File.join(File.dirname(__FILE__), '../test_data/expected_csv/geocoordinate_zipcode_address.csv'))

		api_mock = File.read(File.join(File.dirname(__FILE__), '../test_data/json_mocks/geospatial_query.json'))
		json = JSON.generate(api_mock)

		api = Scf::Api.new
		api.stubs(:services).returns(JSON.parse(json))

		result = Scf::Cli.queryGeospatial(api, "41.307153,-72.925791", ["zipcode", "address"])


		assert_equal(expected_result.force_encoding('UTF-8'), result.force_encoding('UTF-8'))
	end

	def test_invalid_account_name
		api = Scf::Api.new
		result = Scf::Cli.queryAccount(api, "location5", Scf::Cli::DEFAULT_PARAMS)

		assert_equal("An error ocurred or invalid ID", result)
	end

	def test_account_name_translator_custom_params
		api = Scf::Api.new
		expected_result = File.read(File.join(File.dirname(__FILE__), '../test_data/expected_csv/account_29_zipcode_service.csv'))

		result = Scf::Cli.queryAccount(api, "location4", ["zipcode","service_name"])

		assert_equal(expected_result, result.force_encoding('UTF-8'))
	end

end