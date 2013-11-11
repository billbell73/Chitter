class Chitter < Sinatra::Base

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

end