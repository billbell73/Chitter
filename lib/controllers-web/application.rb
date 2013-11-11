class Chitter < Sinatra::Base

	get '/' do
    @peeps = Peep.all :order => :created_at
    erb :index
  end

  post '/' do
  	session[:user_id] = nil
  	redirect to('/')
  end

end