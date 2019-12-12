class HeadshotsController < ApplicationController
  def index
    @headshots = Headshot.all.order({ :created_at => :desc })

    render({ :template => "headshots/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @headshot = Headshot.where({:id => the_id }).at(0)

    render({ :template => "headshots/show.html.erb" })
  end

  def create
    @headshot = Headshot.new
    @headshot.image = params.fetch("image_from_query")

    if @headshot.valid?
      @headshot.save
      redirect_to("/headshots", { :notice => "Headshot created successfully." })
    else
      redirect_to("/headshots", { :notice => "Headshot failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @headshot = Headshot.where({ :id => the_id }).at(0)

    @headshot.image = params.fetch("image_from_query")

    if @headshot.valid?
      @headshot.save
      redirect_to("/headshots/#{@headshot.id}", { :notice => "Headshot updated successfully."} )
    else
      redirect_to("/headshots/#{@headshot.id}", { :alert => "Headshot failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @headshot = Headshot.where({ :id => the_id }).at(0)

    @headshot.destroy

    redirect_to("/headshots", { :notice => "Headshot deleted successfully."} )
  end
end
