ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/chitter.rb')

require 'database_cleaner'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

DatabaseCleaner.strategy = :truncation

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end