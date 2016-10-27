class EventsController < ApplicationController

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
    raise params.inspect
  end


end