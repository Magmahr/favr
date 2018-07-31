class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:id])
    id = @user.id
    @review = Review.find_by user_id: id


  end

end
