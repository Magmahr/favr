class FavorsController < ApplicationController
  # before_action :set_favor, only: [:show]

  def index
    @favors = Favor.all
  end

  def show
    @favor = Favor.find(params[:id])
    favor_id = @favor.requester_id
    @user = User.find(favor_id)
  end

  def new
    @favor = Favor.new
  end

  def create
    @favor = Favor.new(favor_params)
    if @favor.save
      @userfavor = UserFavor.create(user_favor_params)
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


end
