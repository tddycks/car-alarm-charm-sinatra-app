class EventsController < ApplicationController

  get '/events' do
    if logged_in?
      erb :"events/events"
    else
      redirect "/"
    end
  end

  get "/events/new" do
    "Create new event"
  end


end