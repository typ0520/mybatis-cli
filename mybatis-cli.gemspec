# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mybatis/version'

Gem::Specification.new do |spec|
  spec.name          = "mybatis-cli"
  spec.version       = Mybatis::VERSION
  spec.authors       = ["tong"]
  spec.email         = ["php12345@163.com"]
  spec.summary       = %q{mybatis command line tool.}
  spec.description   = %q{mybatis command line tool..}
  spec.homepage      = "https://github.com/typ0520/mybatis-cli"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "thor", "~> 0.19"
end
