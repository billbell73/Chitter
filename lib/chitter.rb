require 'data_mapper'
require 'sinatra/base'


DataMapper.setup(:default, "postgres://localhost/chitter_test")
require_relative 'peep'
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	get '/' do
    @peeps = Peep.all :order => :created_at
    erb :index
  end

end

