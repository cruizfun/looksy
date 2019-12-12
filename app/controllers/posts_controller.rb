class PostsController < ApplicationController
  def index
    @posts = Post.all.order({ :created_at => :desc })

    render({ :template => "posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @post = Post.where({:id => the_id }).at(0)

    render({ :template => "posts/show.html.erb" })
  end

  def create
    @post = Post.new
    @post.user_id = params.fetch("user_id_from_query")
    @post.outfit1_id = params.fetch("outfit1_id_from_query")
    @post.outfit2_id = params.fetch("outfit2_id_from_query")

    if @post.valid?
      @post.save
      redirect_to("/posts", { :notice => "Post created successfully." })
    else
      redirect_to("/posts", { :notice => "Post failed to create successfully." })
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
