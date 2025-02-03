require 'bundler/setup'
require 'byebug'
# Add this to load all files in your lib directory
Dir[File.join(__dir__, '../lib/**/*.rb')].sort.each { |file| require file }
