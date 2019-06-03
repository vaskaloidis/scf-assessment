require "scf/version"
require "scf/cli"

module Scf
  class Error < StandardError; end
  include Methadone::Main
  include Methadone::CLILogging

  main do

    Cli.queryAccount(options[:account])

  end

  version Scf::VERSION

  description '311 Query tool'
  # arg(:account, [:required])
  options[:account] = "29"

  # use_log_level_option

  on("--account ID","The ID of the 311 account to be queried")
  go!
end
