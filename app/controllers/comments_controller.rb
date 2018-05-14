class CommentsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
    flash[:success]="Comment created"
    redirect_back_or micropost_path(@comment.micropost)
    else
    render 'microposts/show'
  end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:micropost_id,:user_id,:parent_id)
  end

end

#reply comment them parent_id va thay doi user_id

#tren view
#if @comment.parent_id.present?
#them <div>
