class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged_in?

  def current_user

    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def is_logged_in?
    return false if current_user.nil?
    current_user.session_token == session[:session_token]
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_url
    end
  end


end
