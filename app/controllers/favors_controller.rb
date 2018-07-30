class FavorsController < ApplicationController
  before_action :set_favor, only: [:show]

  def index
    @favors = Favor.all
  end

  def show
    #code
  end

  private

  def set_favor
    @favor = Favor.find(params[:id])
  end


end
