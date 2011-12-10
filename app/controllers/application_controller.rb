class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user=(value)
    @current_user = value
  end

  def logged_in?
    !!current_user
  end

  def sign_in_and_redirect(user)
    session[:user_id] = user.id
    redirect_to session[:return_path] || root_path
  end

  def sign_out_and_redirect
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
