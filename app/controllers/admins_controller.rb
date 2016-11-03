require "pry"

class AdminsController < ApplicationController

  get "/admins/login" do
    erb :"admins/login", :layout => :"public/layout"
  end

  post "/admins/login" do 
    admin = Admin.find_by_username(params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect "/admins/#{admin.username}"
    else
      redirect "/admins/login"
    end
  end

  get "/admins/logout" do
    session.destroy
    redirect "/admins/login"
  end

  get "/admins/:username" do 
    if session[:admin_id] == Admin.find_by_username(params[:username]).id
      erb :"admins/show", :layout => :"public/layout"
    else
      redirect "/"
    end
  end



end