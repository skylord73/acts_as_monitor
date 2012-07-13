# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_monitor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrea Bignozzi"]
  gem.email         = ["skylord73@gmail.com"]
  gem.description   = %q{Monitor model via private methods warn_*? and error_*?}
  gem.summary       = %q{Monitor models }

  #gem.files               = `git ls-files`.split($\)
  gem.files               = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.md", "CHANGELOG.md", "LICENSE"]
  gem.executables     = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files        = gem.files.grep(%r{^(test|spec|features)/})
  gem.name              = "acts_as_monitor"
  gem.require_paths   = ["lib"]
  gem.version           = ActsAsMonitor::VERSION
  
  gem.add_dependency "rails", "~>3.0.14"
  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  
end
