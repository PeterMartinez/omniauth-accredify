# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-accredify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name     = 'omniauth-accredify'
  gem.version  = OmniAuth::Accredify::VERSION
  gem.authors  = ['Peter Martinez']
  gem.email    = ['Peter@Accredify.com']
  gem.summary  = 'Accredify OAuth2 Strategy for OmniAuth'
  gem.homepage = 'https://api.accredify.com'
  gem.license  = 'MIT'
  gem.description   = %q{OmniAuth strategy for Accredify.}
  gem.summary       = %q{OmniAuth strategy for Accredify.}
  gem.homepage      = "https://api.accredify.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-accredify"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Accredify::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
