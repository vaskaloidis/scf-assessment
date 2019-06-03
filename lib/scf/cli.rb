require "scf/api"
require "json"
require "csv"

module Scf
	class Cli

		def self.convertToCsv(json)
			CSV.generate do |csv|
				csv << ["description, service_name, service_request_id"]
				json.each do |x|
					csv << [x["description"], x["service_name"], x["service_request_id"]]
				end
			end
		end

		def self.queryAccount(api, account)
			# TODO: Detect if in-fact the account-id is invalid
			service_response = api.services(account)
			service_response ? convertToCsv(JSON.parse(service_response)) : "Invalid account-id"
		end

		def self.queryGeospatial(api, coordinates)
			lat  = coordinates.split(',')[0]
			long = coordinates.split(',')[1]
			api.geospatial(lat, long)
		end

		def self.importAccounts(api, file)
			file = File.read(File.join(File.dirname(__FILE__), "../../#{file}"))
			accounts = file.split(',')
			result = []
			accounts.each do |account|
				data = api.services(account)
				if data
					result.concat(JSON.parse(data))
				end
			end
			puts result
			result
		end

	end
end