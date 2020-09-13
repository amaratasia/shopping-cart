class CartItemPresenter
  def initialize(cart)
    @cart = cart
  end

  def items
    @result ||= @cart.cart_items.includes(:product).map do |item|
                  { name: item.product.name, qty: item.qty, price: item.product.price }
                end
  end
end