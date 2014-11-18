# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/cors/halt/version'

Gem::Specification.new do |s|
  s.name        = 'rack-cors-halt'
  s.version     = Rack::Cors::Halt::VERSION
  s.date        = '2014-11-18'
  s.summary     = 'Rack-Cors-Halt'
  s.description = "Halt a CORS request before hitting the controller."
  s.authors     = ["Ricardo Brazão"]
  s.files       = `git ls-files`.split($/).reject { |f| f == '.gitignore' }
  s.license     = 'MIT'


  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "rack-test", ">= 0"
  spec.add_development_dependency "rack-cors", ":require => 'rack/cors'",
                                      "github: 'cyu/rack-cors'", "branch: 'master'"


end