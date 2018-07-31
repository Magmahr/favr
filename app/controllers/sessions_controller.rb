class SessionsController < ApplicationController

  def new # renders form to create a new session
   # new session means user is LOGGED IN
   #code
   render :new
  end

  def create # creates a new session
     #code
  end

  def create
    byebug
    @user = User.find_by(email: params[:email])
  end

end
