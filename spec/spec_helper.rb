# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# loading common gems
require 'rubygems'
require 'fileutils'
require 'yaml'
require_relative '../props'     if File.exists? File.join('props.rb')

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setting up the global configuration
RSpec.configure do |config|
  config.color = true # Use color in STDOUT
  config.tty = true # Use color not only in STDOUT but also in pagers and files
  config.formatter = :documentation # Use the specified formatter (:progress,
  config.after(:all) { FileUtils.remove(Dir.glob('*.yml')) } # :html, :textmate)
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# loading lib files
helpers_path = File.join(Dir.pwd, 'lib', 'helpers')

[File.join(helpers_path, '*helper_spec.rb') # regex for all the helpers files
].each do |regex_files|                     # (ending with "_helper_spec.rb")
  Dir.glob(regex_files).each { |f| require f }
end
