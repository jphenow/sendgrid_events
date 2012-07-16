# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sendgrid_events/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jon Phenow"]
  gem.email         = ["jon.phenow@tstmedia.com"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "sendgrid_events"
  gem.version       = SendgridEvents::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency 'rspec-rails', '~> 2.6'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'rails', '~> 3.0.15'
  gem.add_development_dependency 'factory_girl_rails', '~> 1.7'
  gem.add_development_dependency 'sqlite3'

  gem.add_dependency 'rails', '~> 3.0.15'
  gem.add_dependency 'sendgrid'
  gem.add_dependency 'enumerated_field'
end
