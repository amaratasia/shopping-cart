class CartPresenter
  def initialize(cart)
    @cart = cart

    @discount = 0
    @total=0
    items
  end

  def items
    items = @cart.cart_items.includes(:product)
    @results ||= items.map do |item|
                        subtotal = item.qty * item.product.price
                        item_discount = item.discount
                        total = subtotal - item.discount
                        @total += total
                        @discount += item_discount

                        {
                          name: item.product.name,
                          qty: item.qty,
                          subtotal: subtotal,
                          discount: item_discount,
                          total: total
                        }
                      end
  end

  def discount_total
    @discount + cart_discount
  end

  def total
    @total - cart_discount
  end

  private

  def cart_discount
    @cart_discounts ||= PromotionCategory.cart_logic.where('JSON_EXTRACT(rules, "$.min_val") >= ?', total)
                                                    .select("IFNULL(max(JSON_EXTRACT(rules, '$.discount')), 0) discount_val")[0]
                                                    .discount_val
  end

end