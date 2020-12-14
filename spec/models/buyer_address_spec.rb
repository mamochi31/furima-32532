require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@buyer_address).to be_valid
    end

    it 'buildingが空でも保存できること' do
      @buyer_address.building = nil
      expect(@buyer_address).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できないこと' do
      @buyer_address.postal_code = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include(
        "Postal code can't be blank", 'Postal code Input correctly'
      )
    end

    it 'postal_codeが8桁未満では保存できないこと' do
      @buyer_address.postal_code = '111-111'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeに-がなければ保存できないこと' do
      @buyer_address.postal_code = '111111'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeが全角数字では保存できないこと' do
      @buyer_address.postal_code = '１２３-４５６７'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeが半角英字では保存できないこと' do
      @buyer_address.postal_code = 'aaa-aaaa'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeが全角英字では保存できないこと' do
      @buyer_address.postal_code = 'ａａａ-ａａａａ'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeがひらがなでは保存できないこと' do
      @buyer_address.postal_code = 'あああ-ああああ'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeがカタカナでは保存できないこと' do
      @buyer_address.postal_code = 'アアア-アアアア'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'postal_codeが漢字では保存できないこと' do
      @buyer_address.postal_code = '亜亜亜-亜亜亜亜'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'prefecture_idが空では保存できないこと' do
      @buyer_address.prefecture_id = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include(
        "Prefecture can't be blank", 'Prefecture Select'
      )
    end

    it 'prefecture_idが1では保存できないこと' do
      @buyer_address.prefecture_id = 1
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Prefecture Select')
    end

    it 'cityが空では保存できないこと' do
      @buyer_address.city = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存できないこと' do
      @buyer_address.address = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @buyer_address.phone_number = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include(
        "Phone number can't be blank", 'Phone number Input only number'
      )
    end

    it 'phone_numberが12桁以上では保存できないこと' do
      @buyer_address.phone_number = '090123456789'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end

    it 'phone_numberに-あると保存できないこと' do
      @buyer_address.phone_number = '090-123-456'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberが全角数字では保存できないこと' do
      @buyer_address.phone_number = '０９０１２３４５６７８'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberが半角英字では保存できないこと' do
      @buyer_address.phone_number = 'aaaaaaaaaaa'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberが全角英字では保存できないこと' do
      @buyer_address.phone_number = 'ａａａａａａａａａａａ'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberがひらがなでは保存できないこと' do
      @buyer_address.phone_number = 'あああああああああああ'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberがカタカナでは保存できないこと' do
      @buyer_address.phone_number = 'アアアアアアアアアアア'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberが漢字では保存できないこと' do
      @buyer_address.phone_number = '亜亜亜亜亜亜亜亜亜亜亜'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number Input only number')
    end
  end
end
