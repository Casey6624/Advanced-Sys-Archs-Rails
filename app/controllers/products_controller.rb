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

  private
  def product_params
    params.require(:product).permit(:productName, :brandName, :averageCost, :category, :dateReleased, :description, :productImg)
  end
  def search
    #@products = if params[:term] Product.select("*").where("`productName` LIKE ", "%#{params[:term]}")
      #Product.where("productName LIKE ?", "%#{params[:term]}")
    #else
    #  Product.all, notice = "No matches found for that search term, showing all products."
    #end
    if params[:term].blank?
      redirect_to(root_path, alert: "No search text inputted.")
    end

  end
end
