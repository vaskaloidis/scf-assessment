require "scf/version"
require "scf/cli"

module Scf
	class Error < StandardError;
	end
	include Methadone::Main
	include Methadone::CLILogging

	main do |account, geo|
		api = Api.new

		puts options[:account]
		puts options[:geo]

		if (options[:account])
			puts "Querying by account ID: #{options[:account]}"
			Cli.queryAccount(api, options[:account])
		elsif (options[:geo])
			puts "Querying by Geospatial coordinates: #{geo}"
			Cli.queryGeospatial(api, options[:geo])
		else
			puts "Must specify an account-id or geospatial coordinates with --geo or --account"
		end

	end

	version Scf::VERSION

	description '311 Query tool'

	on("--account ID", "The ID of the 311 account to be queried")
	on("--geo LAT,LONG", "The latitude longitude separated by a coma")

	# use_log_level_option

	go!
end
