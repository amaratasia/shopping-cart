class CartController < ApplicationController

  def items
    items = CartItemPresenter.new(cart).items
    render_json items
  end

  def add_to_cart
    if cart.add_item(add_to_cart_params)
      render_json 'added to cart'
    else
      render_json(cart.errors.full_messages,false, 422)
    end

  end

  private

  def cart
    user = User.first # Should be current user
    @cart ||= user.carts.first # Should fetch from session
  end

  def add_to_cart_params
    params.permit(:product_id, :qty)
  end
end
