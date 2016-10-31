class CommentsController < ApplicationController


  post "/comments" do 
    if logged_in?
     current_user.comments.create(params)
     redirect "/events/#{params[:event_id]}"
    else
      redirect "/"
    end
  end


end