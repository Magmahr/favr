class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit]
  before_action :require_login

  # def show
    # byebug
  # end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def require_login
    return redirect_to "/login" unless session.include? :email
  end

end
