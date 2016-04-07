class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def login_user(user)
    session[:session_token] = user.reset_token!
  end

  def logout
    current_user.try(:reset_token!)
    session[:session_token] = nil
    # redirect_to new_session_url
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redirect_from_root
    current_user ? (redirect_to goals_url) : (redirect_to login_url)
  end

end
