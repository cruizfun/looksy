class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("email_from_query", nil)
    @user.password = params.fetch("password_from_query", nil)
    @user.password_confirmation = params.fetch("password_confirmation_from_query", nil)
    @user.username = params.fetch("username_from_query", nil)
    @user.bra_size = params.fetch("bra_size_from_query", nil)
    @user.top_size = params.fetch("top_size_from_query", nil)
    @user.dress_size = params.fetch("dress_size_from_query", nil)
    @user.pant_size = params.fetch("pant_size_from_query", nil)
    @user.shoe_size = params.fetch("shoe_size_from_query", nil)
    @user.headshot_id = params.fetch("headshot_id_from_query", nil)

    if @user.email == nil || @user.password == nil || @user.password_confirmation == nil || @user.username == nil || @user.bra_size == nil || @user.top_size == nil || @user.dress_size == nil || @user.pant_size == nil || @user.sho_size == nil || @user.headshot_id == nil
      redirect_to("/sign_up", { :alert => "User account failed to create successfully."})
      
    else
      @user.save
      session.store(:user_id,  @user.id)
      redirect_to("/feed", { :notice => "User account created successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("email_from_query", nil)
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query", nil)
    @user.username = params.fetch("username_from_query", nil)
    @user.bra_size = params.fetch("bra_size_from_query", nil)
    @user.top_size = params.fetch("top_size_from_query", nil)
    @user.dress_size = params.fetch("dress_size_from_query", nil)
    @user.pant_size = params.fetch("pant_size_from_query", nil)
    @user.headshot_id = params.fetch("headshot_id_from_query", nil)
    @user.shoe_size = params.fetch("shoe_size_from_query", nil)
    
    if @user.email == nil || @user.password == nil || @user.password_confirmation == nil || @user.username == nil || @user.bra_size == nil || @user.top_size == nil || @user.dress_size == nil || @user.pant_size == nil || @user.sho_size == nil || @user.headshot_id == nil
    render({ :template => "users/edit_profile_with_errors.html.erb" })
    else
      @user.save
      redirect_to("/feed", { :notice => "User account updated successfully."})
    
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
