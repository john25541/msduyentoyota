class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page], per_page: 12)
  end

  def show
    @product = Product.find_by_slug(params[:slug])
    @contact = Contact.new
  end

  private

  def product_params
    params.permit(:name, :price)
  end
end
