class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit]
  # before_action :require_login
  skip_before_action :authorized, only: [:new, :create]

  def show
    render :show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signup successful! Welcome, #{@user.first_name}"
      session[:logged_in_user] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile Successfully Updated!"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: session[:logged_in_user])
    @user.delete
    redirect_to "/"
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
