require "scf/api"
require "json"
require "csv"

module Scf
	class Cli

		def self.queryAccount(api, account)
			# puts "Querying Account: #{account}" # TODO: Add into logger level

			service_response = api.services(account)

			if service_response

				resp = JSON.parse(service_response)

				csv = CSV.generate do |csv|
					csv << ["description, service_name, service_request_id"]
					resp.each do |x|
						csv << [x["description"], x["service_name"], x["service_request_id"]]
					end
				end
				return csv
			else
				puts "Invalid account-id"
			end

		end

		def self.queryGeospatial(api, coordinates)
			lat    = coordinates.split(',')[0]
			long   = coordinates.split(',')[1]
			api.geospatial(lat, long)

		end

	end
end