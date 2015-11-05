require 'rspec'
require 'rspec/core/rake_task'

#pattern = ['spec/spec_helper.rb']   # pattern represents a list of files to be
                                     # loaded within each task, and may be a regex

pattern = []
desc 'Run all specs'
RSpec::Core::RakeTask.new(:all) do |t|
    pattern << 'spec/*_spec.rb'
    t.pattern = pattern
#    task.rspec_opts << '-r spec/spec_helper.rb'
    t.verbose = true
end

desc 'book specs'
RSpec::Core::RakeTask.new(:book) do |t|
    pattern << 'spec/book_spec.rb'
    t.pattern = pattern
    t.verbose = true
end

desc 'library specs'
RSpec::Core::RakeTask.new(:library) do |t|
    pattern << 'spec/library_spec.rb'
    t.pattern = pattern
    t.verbose = true
end


task :default => 'all'
task :book
task :library

desc 'install dependencies'
task :gems_setup do
    system 'bundle install'
end
