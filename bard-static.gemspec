# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bard/static/version"

Gem::Specification.new do |spec|
  spec.name = "bard-static"
  spec.version = Bard::Static::VERSION
  spec.authors = ["Micah Geisel", "Joao Carlos", "Vesa Vänskä", "Matias Korhonen", "Antti Salonen"]
  spec.email = ["micah@botandrose.com"]
  spec.homepage = "https://github.com/botandrose/bard-static"
  spec.summary = "Protoyping engine for Rails."
  spec.description = "Handcrafted prototypes for Rails."
  spec.files = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.md"]

  spec.add_dependency "ostruct"
end
