require 'bundler/setup'
require 'factory_bot'
require 'byebug'

FactoryBot.find_definitions

# Add this to load all files in your lib directory
Dir[File.join(__dir__, '../lib/**/*.rb')].sort.each { |file| require file }
