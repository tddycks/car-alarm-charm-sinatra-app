class UsersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/create_user"
    end
    
  end

  get '/login' do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/login"
    end
  end

  post '/signup' do
    #raise params.inspect
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id
    else
      redirect "/signup"
    end
  end

end