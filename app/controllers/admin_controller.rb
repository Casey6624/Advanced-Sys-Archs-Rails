class AdminController < ApplicationController
  def index
    if !current_user
      redirect_to root_path
    else
      if current_user.userType != "Admin"
        redirect_to root_path
      end
    end
  end
end
