class Buyer < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :product
  has_one :address
end
