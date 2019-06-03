require "scf/version"
require "scf/cli"

module Scf
	class Error < StandardError;
	end
	include Methadone::Main
	include Methadone::CLILogging

	main do |account, geo|
		api = Api.new

		if (account.nil?)
			puts "Querying by account #{account}"
			Cli.queryAccount(api, options[:account])
		elsif (geo.nil?)
			puts "Querying Geospatial #{geo}"
			Cli.queryGeospatial(api, options[:geo])
		else
			puts "Must specify an account-id or geospatial coordinates"
		end

	end

	version Scf::VERSION

	description '311 Query tool'

	arg :account, :optional
	arg :geo, :optional

	# use_log_level_option

	on("--account ID", "The ID of the 311 account to be queried")
	on("--geo LAT,LONG", "The latitude longitude separated by a coma")

	go!
end
