class Chitter < Sinatra::Base

  get '/login' do
  	erb :login
  end

  post '/login' do
  	username, password = params[:username], params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ["Your username or password is incorrect. Please try again"]
      erb :login
    end
  end
end