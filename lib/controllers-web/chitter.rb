require_relative '../server'

# class Chitter < Sinatra::Base
	# set :views, File.join(File.dirname(__FILE__), '..', '..', 'views')

	enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash

	get '/' do
    @peeps = Peep.all :order => :created_at
    erb :index
  end

  post '/' do
  	session[:user_id] = nil
  	redirect to('/')
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
      flash.now[:errors] = user.errors.full_messages
      erb :sign_up
    end
  end

  # get '/login' do
  # 	erb :login
  # end

  # post '/login' do
  # 	username, password = params[:username], params[:password]
  #   user = User.authenticate(username, password)
  #   if user
  #     session[:user_id] = user.id
  #     redirect to('/')
  #   else
  #     flash.now[:errors] = ["Your username or password is incorrect. Please try again"]
  #     erb :login
  #   end
  # end

  get '/add_peep' do
    if session[:user_id]
      erb :add_peep
    else
      flash[:errors] = ["Please register or login in order to peep"]
      redirect to('/')
    end
  end

  post '/add_peep' do
    user = User.get session[:user_id]    
    Peep.create(content: params[:content], user: user)
    redirect to('/')
  end


 	helpers do

    def current_user   
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end

  end

# end

