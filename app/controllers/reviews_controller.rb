class ReviewsController < ApplicationController
  before_action :authorize, :only => [:create, :new]
  def new
    if current_user.nil?
      # change to login 
      redirect_to sessions_url
    end
    if Profile.exists?(user_id: current_user.id)
      #@review = Review.new(review_params)
    else
      redirect_to sessions_url
    end
  end

  def create
    profile = Profile.find(user_id: id)
    if profile.nil?
      redirect_to products_url
    else
      @review = Review.new(review_params.merge(profile_id: profile.id, product_id: [params: id]))
      @review.save
      redirect_to @review
    end
  end

  def show
  end
  private
  def review_params
    params.require(:review).permit(:authorName, :productRating, :reviewText, :dateOfReview)
  end
end
