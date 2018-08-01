class FavorsController < ApplicationController
  before_action :set_favor, only: [:show]
  before_action :require_login

  def index
    @favors = Favor.all
    @user = User.find_by(id: session[:logged_in_user])
  end

  def show
    @favor = Favor.find(params[:id])
    favor_id = @favor.requester_id
    @user = User.find(favor_id)
    @user_favor = UserFavor.new(requester_id: @favor.requester_id, favor_id: @favor.id)
  end

  def new
    @favor = Favor.new
  end

  def create
    requester = current_user
    @favor = Favor.new(favor_params)
    @favor.requester = requester
    if @favor.save
      # @userfavor = UserFavor.create(user_favor_params)
      redirect_to @favor
    else
      render :new
    end

  end

  private

  def set_favor
    @favor = Favor.find(params[:id])
  end

  def favor_params
    params.require(:favor).permit(:name, :description, :date, :requester_id)
  end

  def user_favor_params
    params.require(:user_favor).permit(:id, :requester_id, :favor_id, :requestee_id)
  end

  def require_login
    return redirect_to "/login" unless session.include? :logged_in_user
  end

end
