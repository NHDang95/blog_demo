class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def show
      @user = User.find_by id: params[:id]
      if @user.nil?
        redirect_to root_url
        return
      end
      @microposts = @user.microposts
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by id: params[:id]


  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user = User.find_by(id: params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by(id: params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
