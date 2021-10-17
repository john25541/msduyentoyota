class HomeController < ApplicationController
  def index
    @products = Product.limit(6)
    @all_products = Product.limit(6)
  end
end
