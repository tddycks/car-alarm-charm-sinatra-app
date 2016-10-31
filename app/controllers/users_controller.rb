class UsersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/create_user"
    end
    
  end

  get "/login" do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/login"
    end
  end

  post '/signup' do
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id
      user.update(license_plate: params[:license_plate].upcase.gsub(" ", "").gsub(/\W/, ""))
      user.update(admin_id: "1")
      redirect "/events"
    else
      redirect "/signup"
    end
  end

  post "/login" do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/events"
    else
      redirect "/login"
    end
  end

  get "/users/:slug" do 
    if session[:user_id] == User.find_by_slug(params[:slug]).id
      @user = User.find_by_slug(params[:slug])
      erb :"users/show"
    else
      redirect "/"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end

  end

end