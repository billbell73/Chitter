require 'sinatra'
require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'

require_relative 'model-domain/peep'
require_relative 'model-domain/user'
#require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers-web/login'

require_relative 'controllers-web/chitter'
