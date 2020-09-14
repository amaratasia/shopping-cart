class PromotionCategory < ActiveRecord::Base
  enum promotion_type: {n_for_m: 1, cart_logic: 2}
  has_many :product_promotions

  validates :promotion_type, :rules, presence: true


end
