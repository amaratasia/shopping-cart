class User < ApplicationRecord
  has_many :carts

  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
