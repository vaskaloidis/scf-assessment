require 'test/unit'
require "mocha/test_unit"
require "scf/api"

class TestApi < Test::Unit::TestCase
  def test_expected_data
    expected = <<~EOS
                [
                {
                "description": "",
                "address": "Chapel And College New Haven, Connecticut",
                "lat": 41.3072866,
                "service_request_id": 3114932,
                "requested_datetime": "2016-12-22T14:57:44-05:00",
                "long": -72.9286877,
                "service_code": 17672,
                "status": "closed",
                "zipcode": "06511",
                "updated_datetime": "2018-02-14T09:25:40-05:00",
                "agency_responsible": "City of New Haven",
                "service_name": "Bike Share Station Location Request",
                "media_url": null,
                "expected_datetime": null,
                "address_id": null,
                "service_notice": null,
                "status_notes": null
                }]
                EOS

    api = Scf::Api.new
    result = api.services(29)
    assert (result.include? expected)
  end
end
