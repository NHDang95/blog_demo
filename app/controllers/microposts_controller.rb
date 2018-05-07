class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find_by(id: params[:id])
    @comments = @micropost.comments
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
