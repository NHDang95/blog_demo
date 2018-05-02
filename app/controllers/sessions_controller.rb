class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) #tim tham so email trong table User trong db
    if user && user.authenticate(params [:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = "Invalid Email or Password! Please try again"
      render 'new' #khoi chay function new trong controller -> tro den new trong view
    end
  end

  def destroy
    log_out #tro den function log_out trong sessions_helper
    redirect_to root_url #url validate token
  end
end
