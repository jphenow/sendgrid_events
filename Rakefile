#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  RSpec::Core::RakeTask.new(:docs) do |t|
    t.rspec_opts = ["--format doc"]
  end
end

task :default => :spec
