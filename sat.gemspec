# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sat/version'

Gem::Specification.new do |spec|
  spec.name          = "sat"
  spec.version       = Sat::VERSION
  spec.authors       = ["Patricio Mac Adden"]
  spec.email         = ["patriciomacadden@gmail.com"]
  spec.description   = "Sinatra Application Template"
  spec.summary       = "A sinatra application boilerplate"
  spec.homepage      = "https://github.com/patriciomacadden/sat"
  spec.license       = "MIT"

  spec.files         = ['./bin/sat']
  spec.executables   = ['sat']
  spec.test_files    = []
  spec.require_paths = ["lib"]

  spec.add_dependency 'trollop', '~> 2.0'
end
