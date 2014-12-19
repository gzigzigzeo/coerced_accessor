# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coerced_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = "coerced_accessor"
  spec.version       = CoercedAccessor::VERSION
  spec.authors       = ["Viktor Sokolov"]
  spec.email         = ["gzigzigzeo@evilmartians.com"]
  spec.summary       = %q{Provides object attribute aliases coercing values to/from human readable format}
  spec.description   = %q{Provides object attribute aliases coercing values to/from human readable format}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "activesupport"
end
