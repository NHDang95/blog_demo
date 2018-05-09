class CommentsController < ApplicationController
  def index
  end

  def create

  end

  private
  def comment_params
    params.require(:comment).permit(:content,:micropost_id,:user_id,:parent_id)
  end

end
