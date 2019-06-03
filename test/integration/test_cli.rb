require "methadone/test/base_integration_test"
require "test/unit"
require "mocha/test_unit"

class TestCli < Methadone::BaseIntegrationTest
  def test_usage_info
    stdout,stderr,results = run_app("scf","--help")
    assert_banner(stdout, "scf", takes_options: true, takes_arguments: true)
    assert_option(stdout,"-h", "--help")
    assert_option(stdout,"--version")
    assert_oneline_summary(stdout)
  end


  # def test_account_requests_query
  #   stub_data = <<-EOS
  #     [
  #     {
  #     "description": "",
  #     "service_request_id": 3114932,
  #     "requested_datetime": "2016-12-22T14:57:44-05:00",
  #     "long": -72.9286877,
  #     "service_code": 17672,
  #     "service_name": "Bike Share Station Location Request",
  #     }]
  #   EOS
  #
  #   # stubs = [stub(:queryAccount => stub_data)]
  #   result = Api.any_instance.stubs(:queryAccount).returns(stub_data)
  #
  #   result = Cli.queryAccount(29)
  #
  #   expect(true, result.include(stub_data))
  # end


end
