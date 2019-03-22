lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "figaro_secrets/version"

Gem::Specification.new do |spec|
  spec.authors = ["Cory Kaufman-Schofield"]
  spec.email = ["cory@corykaufman.com"]
  spec.homepage = "https://github.com/allspiritseve/figaro_secrets"
  spec.license = "MIT"
  spec.name = "figaro_secrets"
  spec.summary = "Secrets for Figaro"
  spec.version = FigaroSecrets::VERSION

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_dependency "figaro"
  spec.add_dependency "aws-sdk-secretsmanager"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
