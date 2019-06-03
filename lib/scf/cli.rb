require "scf/api"
require "json"
require "csv"

module Scf
	class Cli

		def self.queryAccount(api, account)
			# puts "Querying Account: #{account}" # TODO: Add into logger level

			resp = JSON.parse(api.services(account))

			csv = CSV.generate do |csv|
				csv << ["description, service_name, service_request_id"]
				resp.each do |x|
					csv << [x["description"], x["service_name"], x["service_request_id"]]
				end
			end

			puts csv
		end

		def self.queryGeospatial(api, coordinates)
			lat = coordinates.split(',')[0]
			long = coordinates.split(',')[1]
			result = api.geospatial(lat, long)
		end

	end
end