require "scf/api"
require "json"

module Scf
	class Cli

		def self.queryAccount(account)
			puts "Querying Account: #{account}"
			api          = Api.new
			api_response = JSON.parse(api.services(account))

			result = api_response.collect do |item|
				{
					 description: item["description"],
					 service_name: item["service_name"],
					 service_request_id: item["service_request_id"]
				}
			end

			puts result.to_s
		end

	end
end