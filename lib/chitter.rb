require 'data_mapper'
require 'sinatra/base'


DataMapper.setup(:default, "postgres://localhost/chitter_test")
require_relative 'peep'
require_relative 'user'
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	enable :sessions
  set :session_secret, 'super secret'

	get '/' do
    @peeps = Peep.all :order => :created_at
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create({name: params["name"], username: params["username"], 
    	email: params["email"], password: params["password"], 
    	password_confirmation: params["confirm_password"]})
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      # flash.now[:errors] = user.errors.full_messages
      # flash[:notice] = "Sorry, password and password confirmation did not match"
      erb :sign_up
    end
  end


 	helpers do

    def current_user   
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end

  end

end

