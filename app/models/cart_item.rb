class CartItem < ApplicationRecord
attr_accessor :discount, :total, :subtotal
  belongs_to :cart
  belongs_to :product

  def discount
    product.product_promotions.map do |promotion|
      promotion.calculate_discount qty
    end.max || 0
  end
end
