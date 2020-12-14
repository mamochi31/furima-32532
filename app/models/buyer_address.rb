class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :buyer_id, :user_id, :product_id, :token

  with_options presence: true do
    validates :token

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
  end

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id)

    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city,
      address: address, building: building, phone_number: phone_number, buyer_id: buyer.id
    )
  end
end
