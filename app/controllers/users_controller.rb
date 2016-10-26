class UsersController < ApplicationController

  get '/signup' do
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

end