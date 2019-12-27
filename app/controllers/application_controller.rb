class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  before_action(:force_user_sign_in)

  
  def load_current_user
    the_id = session.fetch(:user_id)
    @current_user = User.where({ :id => the_id }).at(0)
  end
  
  def force_user_sign_in
    request.session_options = request.session_options.dup
    request.session_options[:expire_after]= 20.minutes
    request.session_options.freeze
    if @current_user == nil
      redirect_to("/sign_in", { :notice => "You have to sign in first." })
    end
  end

end
