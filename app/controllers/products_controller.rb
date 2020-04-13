class ProductsController < ApplicationController
  def index 
    @products=Product.all
  end
  def new
  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end
  def search
    if params[:term].blank?
      redirect_to(products_path, notice: "No search text inputted.") and return
    else
      @parameter = params[:term].downcase
      @products = Product.all.where("lower(productName) LIKE :term", term: @parameter)
    end
  end

  private
  def product_params
    params.require(:product).permit(:productName, :brandName, :averageCost, :category, :dateReleased, :description, :productImg)
  end
end
