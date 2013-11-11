class Chitter < Sinatra::Base

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
  
end