class ReviewsController < ApplicationController
  before_action :authorize, :only => [:create, :new]
  before_action :authorize_profile, :only => [:create, :new]
  def index
    if params.has_key?(:product_id)
      @reviews=Review.select("*").where("product_id = #{params[:product_id]}")
    else
      redirect_to products_path
    end
  end
  def new
    if !Profile.exists?(user_id: current_user.id)
      redirect_to( new_profile_path, notice: "Please create a profile first")
    end    
    profile = Profile.find_by_user_id(current_user.id)
    if Review.exists?(profile_id: profile.id, product_id: params[:product_id])
      redirect_to( products_path, notice: "Product has already been reviewed!")
    end
  end
  def create
    if Profile.exists?(user_id: current_user.id)
      @profile = Profile.where("user_id = #{current_user.id}")
      # Pick out the product_id which is a hidden_field in the review form
      nestedParams = params[:review]
      productId = nestedParams[:product_id]
      if Review.exists?(profile_id: @profile.ids.first, product_id: productId)
        redirect_to(products_path, notice: "You have already reviewed this item! Head to your profile to edit/delete the review.")
      else
        @review = Review.new(review_params.merge(profile_id: @profile.ids.first, product_id: productId))
        @review.authorName = @profile.first.fullName
        @review.save
        redirect_to @review
      end
    else
      redirect_to products_url
    end
  end
  def edit
      @review = Review.find_by_id(params[:id])
      @profile = Profile.find_by_id(@review.profile_id)
      if @profile.user_id !=  current_user.id
        redirect_to products_path, notice: "That review does not belong to you."
      end
  end
  def update
    @review = Review.find_by_id(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render "edit"
    end
  end
  def show
    @review = Review.find(params[:id])
    @profile = Profile.find_by_id(@review.profile_id)
    @product = Product.find_by_id(@review.product_id)
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to products_path, notice: "Review deleted! Returning to products page..."
    end    
  end
  private
  def review_params
    params.require(:review).permit(:authorName, :productRating, :reviewText, :dateOfReview)
  end
end
