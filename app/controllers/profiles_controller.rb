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
  end

  def edit
  end

  def show
  end
end
