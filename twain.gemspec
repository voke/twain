# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twain/version'

Gem::Specification.new do |spec|
  spec.name          = "twain"
  spec.version       = Twain::VERSION
  spec.authors       = ["Gustav"]
  spec.email         = ["gustav@invoke.se"]
  spec.summary       = %q{Build and render text depending on payload}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "liquid", '~> 5.7.0'

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "bundler", "~> 2.5"
  spec.add_development_dependency "rake", "~> 13.0"
end
