class EventsController < ApplicationController

  use Rack::Flash

  get '/events' do
    if logged_in?
      erb :"events/events"
    else
      redirect "/"
    end
  end

  get "/events/new" do
    if logged_in?
      erb :"events/create_event"
    else
      redirect "/"
    end
  end

  post "/events" do 
    #raise params.inspect
    if !params[:address].empty? && !params[:borough].empty?
      current_user.events.create(params)
      redirect "/users/#{current_user.slug}"
    else
      flash[:message] = "Please enter an approximate address and borough:"
      redirect "/events/new"
    end
  end


end