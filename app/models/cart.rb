class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def total
    cart_items.joins(:product).select('qty * price as "total"').first.total
  end

  def add_item(add_to_cart_params)
    cart_items.create(add_to_cart_params)
  end
end
