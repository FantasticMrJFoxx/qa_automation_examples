require 'rspec'
require 'rspec/core/rake_task'


specs_path   = File.join('spec', 'features')
pattern = []

desc 'Run all specs'
RSpec::Core::RakeTask.new(:all) do |t|
  pattern << File.join(specs_path, '*_spec.rb')
  t.pattern = pattern
end

desc 'book specs'
RSpec::Core::RakeTask.new(:book) do |t|
  pattern << File.join(specs_path, 'book_spec.rb')
  t.pattern = pattern
end

desc 'library specs'
RSpec::Core::RakeTask.new(:library) do |t|
  pattern << File.join(specs_path, 'library_spec.rb')
  t.pattern = pattern
end

task default: 'all'
task :book
task :library

desc 'install dependencies'
task :gems_setup do
  system 'bundle install'
end
