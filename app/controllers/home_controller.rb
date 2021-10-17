class HomeController < ApplicationController
  def index
    @products = Product.limit(6)
    @all_products = Product.all.limit(9)
  end
end
