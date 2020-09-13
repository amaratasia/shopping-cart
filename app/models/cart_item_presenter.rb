class CartItemPresenter
  def initialize(cart)
    @cart = cart
  end

  def items
    @result ||= @cart.cart_items.joins(:product).select('qty * price as "total", name').as_json(only: %i[total name])
  end
  def total

  end
end