#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
#~ RSpec::Core::RakeTask.new

#~ task :default => :spec
#~ task :test => :spec
Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end