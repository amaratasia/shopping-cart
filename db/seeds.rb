# Dummy User
user = User.create(email: "amar@asia.com")

# Product

Product.create([{ name: 'A', price: 30 }, { name: 'B', price: 20 }, { name: 'C', price: 50 }, { name: 'D', price: 15 }])

PromotionCategory.create!(promotion_type: 'cart_logic', rules: {min_val: 150, discount: 20})
promotion_category = PromotionCategory.create!(promotion_type: 1, rules: {qty: 3, price: 75})

ProductPromotion.create!(promotion_category: promotion_category, product: Product.last)