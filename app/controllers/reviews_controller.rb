class ReviewsController < ApplicationController

  def create

    favor_id = params[:favor_id].to_i
    @favor = Favor.find(favor_id)
    @user_favor = UserFavor.find_by(favor_id: params[:favor_id].to_i)
    @review = Review.new(review_params)
    if params[:user_id].to_i == @user_favor.requester_id || params[:user_id].to_i == @user_favor.requestee_id
      if  !already_exists? && @review.save
      redirect_to @review.favor
      else
        flash[:notice] = "Please make sure that your review title, body, and rating are not empty before posting your review. You may only write one review per favor."
      end
    else
      flash[:notice] = "Your review could not be posted. Only those directly involved in a Favr can post a review."
      redirect_to favor_path(@favor)
    end
  end

  private

  def already_exists?
    Review.all.any? {|review| review.favor_id == params[:favor_id].to_i && review.user_id == params[:user_id].to_i}
  end

  def review_params
    params.permit(:user_id, :favor_id, :title, :content, :rating)
  end

end
