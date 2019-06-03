require 'test/unit'
require "mocha/test_unit"
require "scf/api"
require "scf/cli"

class TestCli < Test::Unit::TestCase

	def test_service_query
		stub_data = <<-EOS
      [
      {
      "description": "",
      "service_request_id": 3114932,
      "requested_datetime": "2016-12-22T14:57:44-05:00",
      "long": -72.9286877,
      "service_code": 17672,
      "service_name": "Bike Share Station Location Request",
      }]
		EOS

		# stubs = [stub(:queryAccount => stub_data)]
		# Scf::Api.any_instance.stubs(:queryAccount).returns(stub_data)

		result = Scf::Cli.queryAccount(29)

		expected_result = "Querying Account: 29
Endpoint: 29/requests.json
#{stub_data}
"

		assert_equal(expected_result, result)
	end

end