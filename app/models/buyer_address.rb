class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :price

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number
  end

  def save
    user = User.find(params[:user_id])
    product = Product.find(params[:product_id])
    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
      address: address, building: building, phone_number: phone_number
    )
    Buyer.create(user_id: user.id, product_id: product.id)
  end

end