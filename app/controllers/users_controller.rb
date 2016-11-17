class UsersController < ApplicationController

  use Rack::Flash

  get "/signup" do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/create_user", :layout => :"public/layout"
    end
    
  end

  get "/login" do
    if logged_in?
      redirect "/events"
    else 
      erb :"users/login", :layout => :"public/layout"
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
      flash[:message] = "Please enter a username, email address and password. If you have done this and you're still getting this message, the username or email address may be taken."
      erb :"users/create_user", :layout => :"public/layout"
    end
  end

  post "/login" do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/events"
    else
      flash[:message] = "Please enter a valid username and password."
      erb :"users/login", :layout => :"public/layout"
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