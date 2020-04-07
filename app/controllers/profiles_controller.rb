class ProfilesController < ApplicationController
  before_action :authorize, :only => [:create, :show, :edit, :new]
  def new
  end

  def create
  end

  def edit
  end

  def show
  end
end
