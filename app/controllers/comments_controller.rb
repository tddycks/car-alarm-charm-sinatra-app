class CommentsController < ApplicationController


  post "/comments" do 
    if logged_in?
     current_user.comments.create(params)
     Comment.last.update(admin_id: "1")
     redirect "/events/#{params[:event_id]}"
    else
      redirect "/"
    end
  end


end