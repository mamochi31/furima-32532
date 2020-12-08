require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、first_name、last_name、pseudonym_first、pseudonym_last、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角英数字では登録できないこと' do
      @user.password = 'ＡＢＣ１２３'
      @user.password_confirmation = 'ＡＢＣ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'first_nameが英字では登録できないこと' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'first_nameが数字では登録できないこと' do
      @user.first_name = 12_345
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end

    it 'last_nameが英字では登録できないこと' do
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'last_nameが数字では登録できないこと' do
      @user.last_name = 6789
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'pseudonym_firstが空では登録できないこと' do
      @user.pseudonym_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Pseudonym first can't be blank", 'Pseudonym first is invalid')
    end

    it 'pseudonym_firstがひらがなでは登録できないこと' do
      @user.pseudonym_first = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pseudonym first is invalid')
    end

    it 'pseudonym_firstが漢字では登録できないこと' do
      @user.pseudonym_first = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pseudonym first is invalid')
    end

    it 'pseudonym_lastが空では登録できないこと' do
      @user.pseudonym_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Pseudonym last can't be blank", 'Pseudonym last is invalid')
    end

    it 'pseudonym_lastがひらがなでは登録できないこと' do
      @user.pseudonym_last = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pseudonym last is invalid')
    end

    it 'pseudonym_lastが漢字では登録できないこと' do
      @user.pseudonym_last = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pseudonym last is invalid')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
