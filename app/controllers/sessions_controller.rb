class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create]

  def new
   @user = User.new
   render :new
  end

  def create
    @user = User.find_by({email: params[:email]})
    if !!@user && @user.authenticate(params[:password])
      session[:logged_in_user] = @user.id
      # byebug
      flash[:notice] = "Login Successful!"
      redirect_to current_user
    else
      flash[:notice] = "Invalid email or password"
      redirect_to "/login"
    # session[:email] = params[:email]
    # @user = User.find_by(email: params[:email])
    # redirect_to @user
    end
  end

  def destroy
    session.delete :logged_in_user
    redirect_to "/"
  end

end
