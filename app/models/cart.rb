class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def total
    cart_items.joins(:product).select('qty * price as "total"').first.total
  end

  def add_item(add_to_cart_params)
    item = cart_items.find_by(product_id: add_to_cart_params[:product_id])
    if item.present?
      item.qty = item.qty + add_to_cart_params[:qty]
      item.save
    else
      cart_items.create(add_to_cart_params)
    end
  end

end
