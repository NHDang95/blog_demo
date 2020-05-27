class CommentsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @comment = current_user.comments.build(comment_params)
    @micropost = @comment.micropost

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to @micropost
    else
      flash[:danger] = @comment.errors.full_messages.to_s
      redirect_to @micropost
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :micropost_id, :user_id, :parent_id)
  end

end

#reply comment them parent_id va thay doi user_id

#tren view
#if @comment.parent_id.present?
#them <div>
