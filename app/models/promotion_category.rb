class PromotionCategory < ActiveRecord::Base
  enum promotion_type: {n_for_m: 1, cart_logic: 2}

  validates :promotion_type, :rules, presence: true


end
