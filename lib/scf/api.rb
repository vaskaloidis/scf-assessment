require "faraday"
require "json"

module Scf
	class Api

		API_URL ="https://test.seeclickfix.com/open311/v2"

		attr_reader :connection

		def initialize
			@connection = Faraday.new(:url => API_URL)
		end

		def services(account)
			endpoint = "#{account}/requests.json"
			response = @connection.get endpoint
			response.success? ? JSON.parse(response.body) : false

		end

		def geospatial(lat, long)
			endpoint = "requests.json"
			result = @connection.get endpoint, {:lat => lat, :long => long}
			JSON.parse(result.body)
		end

	end
end