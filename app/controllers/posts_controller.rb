class PostsController < ApplicationController
  def community_index
    @posts = Post.all.order({ :created_at => :desc })

    render({ :template => "posts/community_feed.html.erb" })
  end

  def user_index
    @posts = Post.all.order({ :created_at => :desc })

    render({ :template => "posts/user_feed.html.erb" })
  end

  def upload
    render({ :template => "posts/upload_posts.html.erb" })
  end

  def create
    @post = Post.new
    @post.poster_id = session[:user_id]
    @post.outfit1_id = params.fetch("outfit1_id_from_query")
    @post.outfit2_id = params.fetch("outfit2_id_from_query")

    if @post.outfit1_id.to_s.empty? || @post.outfit2_id.to_s.empty?
      redirect_to("/new_post", { :notice => "Please make sure to upload two outfits so the community can vote!" })
    else
      @post.save
      redirect_to("/feed", { :notice => "Post created successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @post = Post.where({ :id => the_id }).at(0)

    @post.user_id = params.fetch("user_id_from_query")
    @post.outfit1_id = params.fetch("outfit1_id_from_query")
    @post.outfit2_id = params.fetch("outfit2_id_from_query")

    if @post.valid?
      @post.save
      redirect_to("/posts/#{@post.id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/posts/#{@post.id}", { :alert => "Post failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @post = Post.where({ :id => the_id }).at(0)

    @post.destroy

    redirect_to("/posts", { :notice => "Post deleted successfully."} )
  end
end
