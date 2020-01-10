class VotesController < ApplicationController
  def create

    @vote = Vote.new
    @vote.voter_id = session[:user_id]
    @vote.post_id = params.fetch("post_id_from_query")

    if params.fetch("bestoutfit1_id_from_query", "none") != "none"
      @vote.bestoutfit_id = params.fetch("bestoutfit1_id_from_query")
      @vote.save
      @vote1 = 1
      @id1 = params.fetch("card_id1")
      respond_to do |format|  
      format.js { render 'posts/feed_partial'}
      end
    elsif params.fetch("bestoutfit2_id_from_query", "nonee") != "none"
      @vote.bestoutfit_id = params.fetch("bestoutfit2_id_from_query")
      @vote.save
      @vote2 = 1
      @id2 = params.fetch("card_id2")
      respond_to do |format|  
      format.js { render 'posts/feed_partial'}
      end
    elsif @vote.post_id == nil
      redirect_to("/feed", { :notice => "Vote failed to create successfully." })
    end  
  end
end
