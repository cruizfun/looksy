class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.voter_id = session[:user_id]
    @vote.post_id = params.fetch("post_id_from_query")
    @vote.bestoutfit_id = params.fetch("bestoutfit_id_from_query")

    if @vote.post_id == nil
      redirect_to("/feed", { :notice => "Vote failed to create successfully." })
    else
      @vote.save
      respond_to do |format|  
        format.js { render 'posts/feed_partial'}
      end
    end  
  end
end
