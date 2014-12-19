$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

require 'rubygems'
require 'bundler/setup'
require 'simplecov'
require 'time'
require 'date'

SimpleCov.start do
  add_filter 'spec'
end

require 'coerced_accessor'
require 'support/test_mock'

RSpec.configure do |config|
  config.order = :random
  config.filter_run(:focus)
  config.run_all_when_everything_filtered = true
end

$: << File.join(File.dirname(__FILE__), '..', 'lib')
