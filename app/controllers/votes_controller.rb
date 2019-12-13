class VotesController < ApplicationController
  def index
    @votes = Vote.all.order({ :created_at => :desc })

    render({ :template => "votes/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @vote = Vote.where({:id => the_id }).at(0)

    render({ :template => "votes/show.html.erb" })
  end

  def create
    @vote = Vote.new
    @vote.voter_id = session[:user_id]
    @vote.post_id = params.fetch("post_id_from_query")
    @vote.bestoutfit_id = params.fetch("bestoutfit_id_from_query")

    if @vote.post_id == nil
      redirect_to("/feed", { :notice => "Vote failed to create successfully." })
    else
      @vote.save
      redirect_to("/feed", { :notice => "Vote created successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @vote = Vote.where({ :id => the_id }).at(0)

    @vote.user_id = params.fetch("user_id_from_query")
    @vote.post_id = params.fetch("post_id_from_query")
    @vote.bestoutfit_id = params.fetch("bestoutfit_id_from_query")

    if @vote.valid?
      @vote.save
      redirect_to("/votes/#{@vote.id}", { :notice => "Vote updated successfully."} )
    else
      redirect_to("/votes/#{@vote.id}", { :alert => "Vote failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @vote = Vote.where({ :id => the_id }).at(0)

    @vote.destroy

    redirect_to("/votes", { :notice => "Vote deleted successfully."} )
  end
end
