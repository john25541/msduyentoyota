class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
    @contact = Contact.new
  end

  private

  def product_params
    params.permit(:name, :price)
  end
end
