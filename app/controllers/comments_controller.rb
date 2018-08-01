class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    
    # params["user_id"].to_i == session[:logged_in_user]
    favor_id = params[:favor_id].to_i
    @favor = Favor.find(favor_id)
    @user_favor = UserFavor.find_by(favor_id: params[:favor_id].to_i)
    @comment = Comment.new(comment_params)

    # if params[:user_id].to_i == user_comment.requester_id || params[:user_id].to_i == user_comment.requestee_id
    # else
    #   flash[:notice] = "You must be a party to this favor to comment"
    # end
    # byebug
    if params[:user_id].to_i == @user_favor.requester_id || params[:user_id].to_i == @user_favor.requestee_id && @comment.save
      redirect_to @comment.favor
    else
      flash[:notice] = "You must be a party to this favor to comment"
      render favor_path(@favor)
    end
  end

  private

  def comment_params
    params.permit(:user_id, :favor_id, :content)
  end

end
