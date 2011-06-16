# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bard_static/version"

Gem::Specification.new do |s|
  s.name = "bard_static"
  s.version = BardStatic::VERSION
  s.authors = ["Micah Geisel", "Joao Carlos", "Vesa Vänskä", "Matias Korhonen", "Antti Salonen"]
  s.email = ["micah@botandrose.com"]
  s.homepage = "https://github.com/botandrose/bard_static"
  s.summary = "Protoyping engine for Rails."
  s.description = "Handcrafted prototypes for Rails."
  s.files = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.md"]
end
