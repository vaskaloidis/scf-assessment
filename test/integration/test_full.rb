require "methadone/test/base_integration_test"
require "test/unit"
require "mocha/test_unit"

class TestFull < Methadone::BaseIntegrationTest
  def test_usage_info
    stdout,stderr,results = run_app("scf","--help")
    assert_banner(stdout, "scf", takes_options: true, takes_arguments: false)
    assert_option(stdout, "--geo")
    assert_option(stdout, "--account")
    assert_option(stdout,"-h", "--help")
    assert_option(stdout,"--version")
    assert_oneline_summary(stdout)
  end


end
