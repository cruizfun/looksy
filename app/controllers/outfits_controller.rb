class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all.order({ :created_at => :desc })

    render({ :template => "outfits/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @outfit = Outfit.where({:id => the_id }).at(0)

    render({ :template => "outfits/show.html.erb" })
  end

  def create
    @outfit = Outfit.new
    @outfit.image = params.fetch("image_from_query")
    @outfit.owner_id = params.fetch("owner_id_from_query")

    if @outfit.valid?
      @outfit.save
      redirect_to("/outfits", { :notice => "Outfit created successfully." })
    else
      redirect_to("/outfits", { :notice => "Outfit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @outfit = Outfit.where({ :id => the_id }).at(0)

    @outfit.image = params.fetch("image_from_query")
    @outfit.owner_id = params.fetch("owner_id_from_query")

    if @outfit.valid?
      @outfit.save
      redirect_to("/outfits/#{@outfit.id}", { :notice => "Outfit updated successfully."} )
    else
      redirect_to("/outfits/#{@outfit.id}", { :alert => "Outfit failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @outfit = Outfit.where({ :id => the_id }).at(0)

    @outfit.destroy

    redirect_to("/outfits", { :notice => "Outfit deleted successfully."} )
  end
end
