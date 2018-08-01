class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit]
  # before_action :require_login
  skip_before_action :authorized, only: [:new, :create]

  def show

    render :show
  end

  private

  def set_user
    @user = User.find_by(id: session[:logged_in_user])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

  def require_login
    return redirect_to "/login" unless session.include? :email
  end

end
