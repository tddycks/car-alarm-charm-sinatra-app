require 'pry'
require 'rack-flash'
require 'pony'

class ApplicationController < Sinatra::Base
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "3 middle names are we"
  end

  get '/' do
    if logged_in?
      redirect "/events"
    else
      erb :"public/index", :layout => :"public/layout"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end


end 