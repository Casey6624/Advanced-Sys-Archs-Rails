class ProfilesController < ApplicationController
  #before_action :authorize, :only => [:create, :show, :edit, :new]
  def index
    @profiles = Profile.all
  end
  def show
    if params.has_key?(:id)
      if Profile.exists?(user_id: params[:id])
        @profile = Profile.find_by(user_id: params[:id])
      end
    end
  end
  def new
    if current_user == nil
      redirect_to sessions_path
    end
    if Profile.exists?(user_id: current_user)
      redirect_to profiles_path
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
  private
  def profile_params
    params.require(:profile).permit(:fullName, :DoB, :address, :city, :country, :profileImg)
  end
end
