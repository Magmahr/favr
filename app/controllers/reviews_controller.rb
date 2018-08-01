class ReviewsController < ApplicationController

  def create

    favor_id = params[:favor_id].to_i
    @favor = Favor.find(favor_id)
    @user_favor = UserFavor.find_by(favor_id: params[:favor_id].to_i)
    @review = Review.new(review_params)

    if params[:user_id].to_i == @user_favor.requester_id || params[:user_id].to_i == @user_favor.requestee_id && @review.save
      redirect_to @review.favor
    else
      flash[:notice] = "You must be a party to this favor to review"
      render favor_path(@favor)
    end
  end

  private

  def review_params
    params.permit(:user_id, :favor_id, :title, :content, :rating)
  end

end
