class ProfilesController < ApplicationController
  #before_action :authorize, :only => [:create, :edit, :new]
  before_action :find_profile, only: [:edit, :update]
  def index
    @profiles = Profile.all
  end
  def show
    if params.has_key?(:id)
      if Profile.exists?(user_id: params[:id])
        @profile = Profile.find_by(user_id: params[:id])
      end
    else
      if Profile.exists?(user_id: current_user.id)
        @profile = Profile.find_by(user_id: current_user.id)
      end
    end
  end
  def new
  end
  def create
    @profile = Profile.new(profile_params)
    @profile.save
  end
  def edit
    if Profile.exists?(user_id: current_user.id)
      @profile = Profile.where("user_id = #{current_user.id}")
    else
      render "new"
    end
  end
  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @article
    else
      render "edit" 
    end
  end
  private
  def find_profile
    @profile = Profile.find_by(params[:id])
  end
  private
  def profile_params
    params.require(:profile).permit(:fullName, :DoB, :address, :city, :country, :profileImg, user_attributes: [:username, :password, :userType])
  end
end
