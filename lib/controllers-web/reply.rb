class Chitter < Sinatra::Base

  get '/reply' do
    if session[:user_id]
      session[:parent_peep_id] = params[:id]
      erb :reply
    else
      flash[:errors] = ["Please register or login in order to reply to a peep"]
      redirect to('/')
    end
  end

  post '/reply' do
    parent_peep = Peep.get session[:parent_peep_id]
    user = User.get session[:user_id]
    child_peep = Peep.create(content: params[:peep_reply], user: user, parent_peep: parent_peep)
    parent_peep.peep= child_peep
    parent_peep.save
    puts "parent_peep_id = #{parent_peep.id}"
    puts "parent_peep.peep id = #{parent_peep.peep.id}"
    puts "child_peep_id = #{child_peep.id}"
    redirect to('/')
  end

  
end