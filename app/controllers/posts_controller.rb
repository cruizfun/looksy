class PostsController < ApplicationController
  def community_index
    @posts = Post.all.order({ :created_at => :desc })

    render({ :template => "posts/looksy.html.erb" })
  end

  def user_index
    @posts = Post.all.order({ :created_at => :desc })
    
    render({ :template => "posts/own_feed.html.erb" })
  end

  def visit_user
    given_username = params.fetch("user_username")
    @selected_user = User.where({ :username => given_username }).first
    @userposts = Post.where({ :poster_id => @selected_user.id }).order({ :created_at => :desc })
    
    render({ :template => "posts/visit_user.html.erb" })
  end

  def upload
    render({ :template => "posts/upload_posts.html.erb" })
  end

  def create

    @outfit1 = Outfit.new
    @outfit1.image = params.fetch("outfit1_from_query", "none")
    @outfit1.owner_id = session[:user_id]

    @outfit2 = Outfit.new
    @outfit2.image = params.fetch("outfit2_from_query", "none")
    @outfit2.owner_id = session[:user_id]

    save_status1 = @outfit1.save
    save_status2 = @outfit2.save

    if save_status1 == true && save_status2 == true
      @post = Post.new
      @post.outfit1_id = @outfit1.id
      @post.outfit2_id = @outfit2.id
      @post.poster_id = @current_user.id
      @post.save
      redirect_to("/feed", { :notice => "Post created successfully." })

    else
      redirect_to("/new_post", { :alert => "Please make sure to upload two outfits so the community can vote!" })
    end

  end

  def destroy
    the_id = params.fetch("post_id_from_query")
    post = Post.where({ :id => the_id }).at(0)
    corr_outfit1 = Outfit.where({ :id => post.outfit1_id }).first
    corr_outfit2 = Outfit.where({ :id => post.outfit2_id }).first

    post.destroy
    corr_outfit1.destroy
    corr_outfit2.destroy

    @posts = Post.all.order({ :created_at => :desc })
    
    render({ :template => "posts/own_feed.html.erb" })
  end
end
