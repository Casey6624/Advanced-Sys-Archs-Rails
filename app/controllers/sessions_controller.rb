class SessionsController < ApplicationController
  def index
    redirect_to root_path
  end
  def new
  end

  def create
    # maybe @user?
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      session[:userid] = user.id
      redirect_to root_path, notice: "welcome #{user.username}, you are logged in."
    else
      render "new", alert:
      "invalid username/password combination."    
    end
  end

  def destroy
    session[:username] = nil
    session[:userid] = nil
    redirect_to root_path, notice: "Successfully logged out."
  end
end
