class ProductsController < ApplicationController

  def index
    products  = Product.all.as_json(only: [:name, :price])
    render_json products
  end
end
