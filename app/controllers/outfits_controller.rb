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
    @outfit1 = Outfit.new
    @outfit1.image = params.fetch("outfit1_from_query", "No image provided")
    @outfit1.owner_id = session[:user_id]

    @outfit2 = Outfit.new
    @outfit2.image = params.fetch("outfit2_from_query", "No image provided")
    @outfit2.owner_id = session[:user_id]

    if @outfit1.image.to_s.empty? || @outfit2.image.to_s.empty?
      redirect_to("/new_post", { :alert => "Please make sure to upload two outfits so the community can vote!" })
    else
      @outfit1.save
      @outfit2.save
      new_post = Post.new
      new_post.outfit1_id = @outfit1.id
      new_post.outfit2_id = @outfit2.id
      new_post.poster_id = @current_user.id
      new_post.save
      redirect_to("/feed", { :notice => "Outfit created successfully!" })
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
