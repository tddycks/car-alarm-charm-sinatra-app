require 'pry'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "3 middle names are we"
  end

  get '/' do
    "Hello there"
  end


end