class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    posts_path
  end

  helper_method :get_current_user
  #allows the current_user method to be accessed from the all the views (since its application_controller from which the specific controllers inherit the methods and attributes)

  #cashe-ing the current_user so that dont have to make multiple database (very slow) queries for diff info
  def get_current_user
    @current_user ||= User.find(session[:user_id]) unless
    session[:user_id].blank?
    return @current_user
  end
  # ||= means check if @current_user already has a value, else give it the right hand side value


end
