class Product < ApplicationRecord

  has_many :product_promotions
  validates :name, :price, presence: true

end
