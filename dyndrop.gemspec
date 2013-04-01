# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dyndrop/version"

Gem::Specification.new do |s|
  s.name        = "dyndrop"
  s.version     = Dyndrop::VERSION.dup
  s.authors     = ["Dyndrop Team", "Nicolas Deschildre"]
  s.email       = ["team@dyndrop.com"]
  s.homepage    = "http://github.com/dyndrop/dyndrop"
  s.summary     = %q{
    High-level library for working with the Dyndrop API.
  }

  s.files         = %w(LICENSE) + Dir.glob("lib/**/*") 
  s.test_files    = Dir.glob("spec/**/*")
  s.require_paths = %w[lib]

end
