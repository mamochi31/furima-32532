class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipment_date
  belongs_to :category
  has_one_attached :image


  with_options presence: true do
    validates :name, :price, :text, :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id, :shipping_fee_id, :prefecture_id, :shipment_date_id, :category_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
