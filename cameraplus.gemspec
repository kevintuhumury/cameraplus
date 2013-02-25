# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cameraplus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "cameraplus"
  gem.version       = Cameraplus::VERSION
  gem.authors       = ["Kevin Tuhumury"]
  gem.email         = ["kevin.tuhumury@gmail.com"]
  gem.homepage      = "http://github.com/kevintuhumury/cameraplus"
  gem.summary       = %q{A Ruby wrapper around the Camera+ (camerapl.us) API.}
  gem.description   = %q{This gem provides a Ruby wrapper around the Camera+ (http://camerapl.us) iPhone app Web Sharing API for use in your own project.}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "httparty"

  gem.add_development_dependency "vcr"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "spec_coverage"
  gem.add_development_dependency "coveralls"
end
