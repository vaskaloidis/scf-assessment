
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "scf/version"

Gem::Specification.new do |spec|
  spec.name          = "scf"
  spec.version       = Scf::VERSION
  spec.authors       = ["vaskaloidis"]
  spec.email         = ["vas.kaloidis@gmail.com"]

  spec.summary       = "SCF Assessment"

  spec.license       = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "to-do: Set to 'http://mygemserver.com'"


    spec.metadata["source_code_uri"] = "https://github.com/vaskaloidis/scf-assessment"
    # spec.metadata["changelog_uri"] = "to-do: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency('rdoc')
  spec.add_dependency('methadone', '~> 2.0.2')
  spec.add_development_dependency('test-unit')
  spec.add_dependency('faraday')
	spec.add_dependency('mocha')
	spec.add_dependency('csv')
end
