class ApplicationController < ActionController::Base
before_action :authorized, except: [:index]
helper_method :logged_in?, :current_user

  def current_user
    @user = User.find_by(id: session[:logged_in_user])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless logged_in?
      flash[:notice] = "You must be logged in to view this page."
      redirect_to "/"
    end
  end


end
