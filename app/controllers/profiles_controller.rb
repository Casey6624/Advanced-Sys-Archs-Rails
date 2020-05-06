class ProfilesController < ApplicationController
  #before_action :authorize, :only => [:create, :edit, :new]
  def index
    @profiles = Profile.all
  end
  def show
    if params.has_key?(:id)
      if Profile.exists?(user_id: params[:id])
        @profile = Profile.find_by(user_id: params[:id])
        @reviews = Review.find_by_sql("SELECT reviews.id AS \"review_id\", reviewText, authorName, productRating, product_id, products.productName, products.category, reviews.created_at FROM `reviews` JOIN products ON products.id = reviews.product_id WHERE `profile_id` = #{@profile.id}")
        if @profile.user_id == current_user.id
          @isThisLoggedInUser = true
        else
          @isThisLoggedInUser = false
        end
      else
        render "new"
      end
    else
      render "new"
    end
  end
  def new
    if current_user == nil
      redirect_to sessions_path
    end
    if Profile.exists?(user_id: current_user.id)
      redirect_to profiles_path
    end
  end
  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    if @profile.save
      redirect_to @profile
    else
      render "new"
    end
  end
  def edit
    if Profile.exists?(params[:id])
      @profile = Profile.find(params[:id])
    else
      render "new"
    end
  end
  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render "edit"
    end
  end
  def destroy
  end
  private
  def profile_params
    params.require(:profile).permit(:fullName, :DoB, :address, :city, :country, :profileImg)
  end
end