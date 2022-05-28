# frozen_string_literal: true

require_relative "lib/dalore/version"

Gem::Specification.new do |spec|
  spec.name = "dalore"
  spec.version = Dalore::VERSION
  spec.authors = ["assaf416"]
  spec.email = ["assaf.goldstein@gmail.com"]

  spec.summary = "Trading Robots framework."
  spec.description = "Create Test and run trading robots for stocks and virtual coins"
  spec.homepage = "https://github.com/assaf416/dalore"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = " Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/assaf416/dalore"
  spec.metadata["changelog_uri"] = "https://github.com/assaf416/dalore"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "binance"
  spec.add_dependency "redis"
  spec.add_dependency "httparty"
  #spec.add_dependency "coinmarketcap"
  #spec.add_dependency "unicorn"
  #spec.add_dependency "eventmachine"
  spec.add_dependency "sinatra"
  spec.add_dependency "technical-analysis"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
