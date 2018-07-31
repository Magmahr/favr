class SessionsController < ApplicationController

  def new
   @user = User.new
   render :new
  end

  def create
    @user = User.find_by(email: params[:email])
    session[:email] = params[:email]
    redirect_to @user
  end

  def destroy
    session.delete :email
    redirect_to :root
  end

end
