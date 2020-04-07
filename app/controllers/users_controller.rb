class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_path, notice:
      "Welcome! #{@user.username}"
    else
      render "new"
  end
end
  private
def user_params
  params.require(:user).permit(:username, :password, :userType)
end
end