class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create

    # params["user_id"].to_i == session[:logged_in_user]
    # byebug
    favor_id = params[:favor_id].to_i
    @favor = Favor.find(favor_id)
    @user_favor = UserFavor.find_by(favor_id: params[:favor_id].to_i)
    
    @comment = Comment.new(comment_params)
    if params[:user_id].to_i == @user_favor.requester_id || params[:user_id].to_i == @user_favor.requestee_id && @comment.save
      redirect_to @comment.favor
    else
      flash[:notice] = "Your comment could not be posted. Only those directly involved in a Favr can post a comment. If you are involved in this Favr, please make sure that the comment body is not empty before posting."
      redirect_to favor_path(@comment.favor)
    end
  end

  private

  def comment_params
    params.permit(:user_id, :favor_id, :content)
  end

end
