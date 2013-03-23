# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'koda-ui/version'

Gem::Specification.new do |s|
  s.name        = "koda-ui"
  s.version     = Koda::UI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcel du Prez", "Derek Ekins"]
  s.email       = ["marceldupr@gmail.com", "derek@spathi.com"]
  s.homepage    = "https://github.com/KodaFramework"
  s.summary     = "Koda UI - helpers to build a koda backed website"
  s.description = "Koda UI - helpers to build a koda backed website"

  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency 'koda-content'

  s.add_development_dependency 'rspec', '>= 2.8'
  s.add_development_dependency 'rake'

  s.files        = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
end