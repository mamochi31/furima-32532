class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number
  end

  def save
    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
      address: address, building: building, phone_number: phone_number
    )
end