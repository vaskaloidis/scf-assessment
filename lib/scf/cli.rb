require "scf/api"
require "json"
require "csv"

module Scf
	class Cli

		DEFAULT_PARAMS = ["description", "service_name", "service_request_id"]
		ACCOUNTS_FILE  = '../../accounts.csv'

		def self.convertToCsv(json, params)
			result = CSV.generate do |csv|
				csv << params
				json.each do |service|
					csv << params.collect do |param|
						service[param]
					end
				end
			end
			result
		end

		def self.filterResults(results, search)
			modified = results.select do |result|
				found = false
				result.each do |key, value|
					if value.to_s.include? search
						found = true
						break
					end
				end
				found
			end
			modified
		end

		def self.queryAccount(api, account, params, search)
			file             = File.join(File.dirname(__FILE__), ACCOUNTS_FILE)
			csv              = CSV.foreach(file, headers: true) do |row|
				name = row[0]
				if name == account
					account = row[1]
					break
				end
			end
			service_response = search ? filterResults(api.services(account), search) : api.services(account)
			service_response ? convertToCsv(service_response, params) : "An error ocurred or invalid ID"
		end

		def self.queryGeospatial(api, coordinates, params, search)
			lat      = coordinates.split(',')[0]
			long     = coordinates.split(',')[1]
			filtered = search ? filterResults(api.geospatial(lat, long), search) : api.geospatial(lat, long)
			csv      = convertToCsv(filtered, params)
			csv
		end

	end
end