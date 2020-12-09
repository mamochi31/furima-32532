require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    it 'name、price、text、status_id、shipping_fee_id、prefecture_id、shipment_date_id、category_id、imageが存在すれば登録できる' do
      expect(@product).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満では登録できないこと' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999より大きければ登録できないこと' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceは全角数字では登録できないこと' do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'textが空では登録できないこと' do
      @product.text = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Text can't be blank")
    end

    it 'status_idが空では登録できないこと' do
      @product.status_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Status is not a number')
    end

    it 'status_idが1では登録できないこと' do
      @product.status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Status must be other than 1')
    end

    it 'shipping_fee_idが空では登録できないこと' do
      @product.shipping_fee_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipping fee is not a number')
    end

    it 'shiooing_fee_idが1では登録できないこと' do
      @product.shipping_fee_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipping fee must be other than 1')
    end

    it 'prefecture_idが空では登録できないこと' do
      @product.prefecture_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'prefecture_idが1では登録できないこと' do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'shipment_date_idが空では登録できないこと' do
      @product.shipment_date_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipment date is not a number')
    end

    it 'shipment_date_idが1では登録できないこと' do
      @product.shipment_date_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipment date must be other than 1')
    end

    it 'category_idが空では登録できないこと' do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Category is not a number')
    end

    it 'category_idが1では登録できないこと' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end

    it 'imageが空では登録できないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
  end
end
