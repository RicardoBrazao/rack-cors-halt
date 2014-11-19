# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/cors/halt/version'

Gem::Specification.new do |spec|
  spec.name        = 'rack-cors-halt'
  spec.version     = Rack::Cors::Halt::VERSION
  spec.date        = '2014-11-18'
  spec.summary     = %q{Rack-Cors-Halt}
  spec.description = %q{Halt a CORS request before hitting the controller.}
  spec.authors     = ["Ricardo Brazão"]
  spec.email       = ["ricardo.p.pbrazao@gmail.com"]
  spec.files       = `git ls-files`.split($/).reject { |f| f == '.gitignore' }
  spec.license     = 'MIT'


  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
end