class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create

    @user = User.new
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")

    save_status = @user.save

    if save_status == true
      @user.save
      session.store(:user_id,  @user.id)
      redirect_to("/feed", { :notice => "User account created successfully!"})      
    else
      redirect_to("/sign_up", { :alert => "Please include all fields"})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update

    @headshot = Headshot.new
    @headshot.image = params.fetch("headshot_from_query", "none")
    
    save_status1 = @headshot.save

    @user = @current_user
    @user.email = @current_user.email
    @user.username = @current_user.username
    @user.bra_size = params.fetch("bra_size_from_query", "none")
    @user.top_size = params.fetch("top_size_from_query", "none")
    @user.dress_size = params.fetch("dress_size_from_query", "none")
    @user.pant_size = params.fetch("pant_size_from_query", "none")
    @user.shoe_size = params.fetch("shoe_size_from_query", "none")
  
    height = params.fetch("height_feet_from_query", "none").to_s + params.fetch("height_inch_from_query", "none").to_s
    @user.height = height
    @user.headshot_id = @headshot.id

    save_status2 = @user.save
   
    if save_status1 == true && save_status2 == true
      @user.save
      redirect_to("/feed", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end

  end

  def destroy
    @current_user.destroy
    user_posts = Post.where({ :poster_id => @current_user.id }).all

      user_posts.each do |post|
        corr_outfit1 = Outfit.where({ :id => post.outfit1_id }).destroy
        corr_outfit2 = Outfit.where({ :id => post.outfit2_id }).destroy
      end

    user_posts.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account deleted" })
  end
  
end
