class ProfilesController < ApplicationController
  #before_action :authorize, :only => [:create, :show, :edit, :new]
  def new
    if current_user == nil
      redirect_to products_url
    end
    if Profile.exists?(user_id: current_user)
      redirect_to :action => "show"
    end
  end
  def create
    # add if / else statements
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    @profile.save
    redirect_to @profile
  end
  def edit
  end
  def show
    if current_user == nil
      # change to login route
      redirect_to products_url
    else
      @profile = Profile.find_by(user_id: current_user.id)
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:fullName, :DoB, :address, :city, :country)
  end
end
