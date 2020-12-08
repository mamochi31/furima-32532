class Product < ApplicationRecord

  with_options presence: true do
    validates :name, :price, :text, :status_id, :shipping_fee_id, :prefecture_id,
              :shipment_date_id, :category_id
  end

end
