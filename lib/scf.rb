require "scf/version"
require "scf/cli"

module Scf
	class Error < StandardError;
	end
	include Methadone::Main
	include Methadone::CLILogging


	main do |account, geo|
		api    = Api.new
		params = options[:params]

		if options[:params] != Scf::Cli::DEFAULT_PARAMS
			params = options[:params].split(options[:param_delimeter])
		end

		if options[:account]
			account = options[:account]
			puts "Querying by account ID: #{account}"
			puts Cli.queryAccount(api, account, params)
		elsif options[:geo]
			geo = options[:geo]
			puts "Querying by Geospatial coordinates: #{geo}"
			puts Cli.queryGeospatial(api, geo, params)
		else
			puts "Must specify an account-id, geospatial coordinates or an import file with account ID's"
		end

	end

	version Scf::VERSION

	description '311 Query tool'

	options[:param_delimeter] = ","
	options[:params]          = Scf::Cli::DEFAULT_PARAMS

	on("--account ID", "The ID of the 311 account to be queried")
	on("--geo LAT,LONG", "The latitude longitude separated by a coma")

	on("--params PARAM3+PARAM2+PARAM3", "Specify the parameters you would like to have returned in CSV")
	on("--param_delimeter <DELIMETER>", "Specify an alternate delimeter when listing parameters with --params")


# use_log_level_option

	go!
end
