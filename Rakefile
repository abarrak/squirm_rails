require 'rake/clean'
require 'rake/testtask'
require_relative 'lib/tasks/your_engine_tasks.rake'

CLEAN.include "pkg", "test/coverage", "doc", "*.gem"

task default: :test

task :gem do
  sh "gem build squirm_rails.gemspec"
end

task :test do
  Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList["test/*_test.rb"]
    t.verbose = false
  end
end
