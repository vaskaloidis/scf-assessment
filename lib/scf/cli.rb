require "scf/api"
require "json"
require "csv"

module Scf
	class Cli

		DEFAULT_PARAMS = ["description", "service_name", "service_request_id"]

		def self.convertToCsv(json, params)
			puts "Converting to CSV"
			result = CSV.generate do |csv|
				csv << params
				json.each do |service|
					csv << params.collect do |param|
						service[param]
					end
				end
			end
			puts "Done converting"
			puts result
			result
		end

		def self.queryAccount(api, account, params)
			service_response = api.services(account)
			service_response ? convertToCsv(service_response, params) : "Invalid account-id"
		end

		def self.queryGeospatial(api, coordinates, params)
			lat  = coordinates.split(',')[0]
			long = coordinates.split(',')[1]
			convertToCsv(api.geospatial(lat, long), params)
		end

	end
end