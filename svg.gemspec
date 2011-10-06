# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "svg"
  s.version     = "0.1"
  s.authors     = ["Bernerd Schaefer"]
  s.email       = ["bj.schaefer@gmail.com"]
  s.homepage    = "https://github.com/bernerdschaefer/svg"
  s.summary     = "A ruby library for generating SVG built on libxml-ruby"
  s.description = s.summary

  s.add_dependency "libxml-ruby"
  s.add_development_dependency "rspec"

  s.files = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = "lib"
end
