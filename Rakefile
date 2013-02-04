# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'rake/task'

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
Bundler::GemHelper.install_tasks

task :default => :spec
