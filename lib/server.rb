require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'

require_relative 'model-domain/peep'
require_relative 'model-domain/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers-web/login'
require_relative 'controllers-web/sign_up'
require_relative 'controllers-web/add_peep'
require_relative 'controllers-web/application'
require_relative 'controllers-web/reply'

class Chitter < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')
	
	enable :sessions
	set :session_secret, 'super secret'
	use Rack::Flash
end