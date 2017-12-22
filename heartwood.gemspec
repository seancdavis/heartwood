# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartwood/version'

Gem::Specification.new do |spec|
  spec.name          = "heartwood"
  spec.version       = Heartwood::VERSION
  spec.authors       = ["Sean C Davis", "Warren Harrison"]
  spec.email         = ["scdavis41@gmail.com", "warren@hungry-media.com"]
  spec.summary       = %q{Rails generators to facilitate development.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = Dir["spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'capybara-screenshot'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'poltergeist'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'

  spec.add_dependency 'database_cleaner'
  spec.add_dependency 'hashie'
  spec.add_dependency 'rails', '~> 5.1.0'
  spec.add_dependency 'rake'
end
