class SessionsController < ApplicationController

  def create
    byebug
    @user = User.find_by(email: params[:email])
  end
end
