class ProductPromotion < ApplicationRecord
  belongs_to :promotion_category
  belongs_to :product

  def calculate_discount(qty)
    price = qty * product.price
    if promotion_category.n_for_m? && promotion_category.rules['qty'] <= qty
      price - (qty / promotion_category.rules['qty'] * promotion_category.rules['price'])
    else
      0
    end
  end
end
