require "pry"
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
    if !params[:address].empty?
      current_user.events.create(params)
      redirect "/users/#{current_user.slug}"
    else
      flash[:message] = "Please enter an approximate address and borough:"
      redirect "/events/new"
    end
  end

  get "/events/:id/edit" do 
    if current_user.events.include?(Event.find(params[:id]))
      @event = Event.find(params[:id])
      erb :"events/edit_event"
    else
      redirect "/"
    end
  end

  get "/events/:id" do
    erb :"events/show"
  end

  patch "/events/:id" do 
    #raise params.inspect
    if current_user.events.include?(Event.find(params[:id])) && !params[:address].empty?
      @event = Event.find(params[:id])
      @event.update(address: params[:address], borough: params[:borough], license_plate: params[:license_plate], car_model: params[:car_model])
      redirect "/events/#{@event.id}"
    else
      redirect "/"
    end
  end


  delete "/events/:id/delete" do 
    if current_user.events.include?(Event.find(params[:id]))
      Event.find(params[:id]).destroy
      flash[:message] = "Alarm Deleted!"
      redirect "/users/#{current_user.slug}"
    else
      redirect "/"
    end
  end


end