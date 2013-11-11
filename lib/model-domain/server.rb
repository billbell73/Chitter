require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'peep'
require_relative 'user'

DataMapper.finalize
DataMapper.auto_upgrade!