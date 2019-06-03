require "faraday"

module Scf
	class Api

		API_URL ="https://test.seeclickfix.com/open311/v2"

		attr_reader :connection

		def initialize
			@connection = Faraday.new(:url => API_URL)
		end

		def services(account)
			endpoint = "#{account}/requests.json"
			# puts "Endpoint: #{endpoint}"
			result = @connection.get endpoint
			result.body
		end

		def geospatial(lat, long)
			endpoint = "requests.json"
			result = @connection.get endpoint, {:lat => lat, :long => long}
			result.body
		end

	end
end