class ReviewsController < ApplicationController
  before_action :authorize, :only => [:create, :new]
  def index
    if params.has_key?(:product_id)
      @reviews=Review.select("*").where("product_id = #{params[:product_id]}")
    else
      redirect_to products_path
    end
  end
  def new
    if current_user.nil?
      # change to login 
      redirect_to sessions_path
    end
    if !Profile.exists?(user_id: current_user.id)
      redirect_to profiles_path
    end
  end
  def create
    if Profile.exists?(user_id: current_user.id)
      profile = Profile.find_by_user_id(current_user.id)
      # Pick out the product_id which is a hidden_field in the review form
      nestedParams = params[:review]
      productId = nestedParams[:product_id]
      if Review.exists?(profile_id: profile.id, product_id: productId)
        if @review = Review.update(review_params)
          redirect_to reviews_path
        else
          redirect_to products_path
        end
      else
        @review = Review.new(review_params.merge(profile_id: profile.id, product_id: productId))
        @review.authorName = profile.fullName
        @review.save
        redirect_to @review
      end
    else
      redirect_to products_url
    end
  end

  def show
    @review = Review.find(params[:id])
  end
  private
  def review_params
    params.require(:review).permit(:authorName, :productRating, :reviewText, :dateOfReview)
  end
end
