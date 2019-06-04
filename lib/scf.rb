require "scf/version"
require "scf/cli"

module Scf
	class Error < StandardError;
	end
	include Methadone::Main
	include Methadone::CLILogging

	main do
		api    = Api.new
		params = options[:params]
		search = options[:search]

		if options[:params] != Scf::Cli::DEFAULT_PARAMS
			params = options[:params].split(options[:param_delimeter])
		end

		if options[:account]
			account = options[:account]
			puts "Querying by account Name/ID: #{account}"
			puts Cli.queryAccount(api, account, params, search)
		elsif options[:geo]
			geo = options[:geo]
			puts "Querying by Geospatial coordinates: #{geo}"
			puts Cli.queryGeospatial(api, geo, params, search)
		else
			puts "Must specify an account-id, account-name, geospatial coordinates"
		end

	end

	version Scf::VERSION

	description 'SeeClickFix Query tool'

	options[:param_delimeter] = ","
	options[:params]          = Scf::Cli::DEFAULT_PARAMS
	options[:search] = false

	on("--account [ID|NAME]", "The ID or name of the 311 account to be queried")
	on("--geo LAT,LONG", "The latitude longitude separated by a coma")

	on("--params PARAM3+PARAM2+PARAM3", "Specify the parameters you would like to have returned in CSV")
	on("--param_delimeter <DELIMETER>", "Specify an alternate delimeter when listing parameters with --params")

	on("--search KEYWORD", "Only returns results that contain this keyword somewhere in one of it's fields")


# use_log_level_option

	go!
end
