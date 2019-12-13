class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("email_from_query","not provided")
    @user.password = params.fetch("password_from_query", "not provided")
    @user.password_confirmation = params.fetch("password_confirmation_from_query", "not provided")
    @user.username = params.fetch("username_from_query", "not provided")
    @user.bra_size = params.fetch("bra_size_from_query", "not provided")
    @user.top_size = params.fetch("top_size_from_query", "not provided")
    @user.dress_size = params.fetch("dress_size_from_query", "not provided")
    @user.pant_size = params.fetch("pant_size_from_query", "not provided")
    @user.shoe_size = params.fetch("shoe_size_from_query","not provided")
    @user.headshot_id = params.fetch("headshot_id_from_query", "not provided")

    save_status = @user.save

    if save_status == true
      @user.save
      session.store(:user_id,  @user.id)
      redirect_to("/feed", { :notice => "User account created successfully."})
    else
      redirect_to("/sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")
    @user.bra_size = params.fetch("bra_size_from_query")
    @user.top_size = params.fetch("top_size_from_query")
    @user.dress_size = params.fetch("dress_size_from_query")
    @user.pant_size = params.fetch("pant_size_from_query")
    @user.headshot_id = params.fetch("headshot_id_from_query")
    @user.shoe_size = params.fetch("shoe_size_from_query")
    
    if @user.valid?
      @user.save

      redirect_to("/feed", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
