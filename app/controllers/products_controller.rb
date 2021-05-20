class ProductsController < ApplicationController
  def index
  end
  def show
    @product = Product.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def product_params
    params.permit(:name, :price)
  end
end
