require 'rails_helper'

RSpec.describe RecordShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user:)
    @record_shipping = FactoryBot.build(:record_shipping, prefecture_id: 2, item_id: item.id, user_id: user.id)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it '必要な情報を適切に入力すると、購入できる' do
        expect(@record_shipping).to be_valid
      end

      it 'building_nameは空でも購入できる' do
        @record_shipping.building_name = ''
        expect(@record_shipping).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_cordが空では購入できない' do
        @record_shipping.post_cord = ''
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Post cord can't be blank")
      end

      it 'post_cordが半角のハイフンを含んでいないと保存できないこと' do
        @record_shipping.post_cord = '1234567'
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end

      it 'post_cordが半角のハイフンと半角数値以外では購入できない' do
        @record_shipping.post_cord = 'abc-defg'
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end

      it 'post_cordが3桁の数字、ハイフン、4桁の数字以外の形式では購入できない' do
        @record_shipping.post_cord = '1234-567'
        @record_shipping.invalid?
        expect(@record_shipping.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1（"--"）では購入できない' do
        @record_shipping.prefecture_id = 1
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空では購入できない' do
        @record_shipping.municipalities = ''
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'street_addressが空では購入できない' do
        @record_shipping.street_address = ''
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Street address can't be blank")
      end

      it 'telephon_numberが空では購入できない' do
        @record_shipping.telephon_number = ''
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Telephon number can't be blank")
      end

      it 'telephon_numberが9桁以下の半角数値では購入できない' do
        @record_shipping.telephon_number = '123456789'
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include('Telephon number must be 10 or 11 digits')
      end

      it 'telephon_numberが12桁以上の半角数値では購入できない' do
        @record_shipping.telephon_number = '123456789012'
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include('Telephon number must be 10 or 11 digits')
      end

      it 'telephon_numberが半角数値以外では購入できない' do
        @record_shipping.telephon_number = 'abcdefghijk'
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include('Telephon number must be 10 or 11 digits')
      end

      it 'tokenが空では登録できないこと' do
        @record_shipping.token = nil
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @record_shipping.user_id = nil
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @record_shipping.item_id = nil
        @record_shipping.valid?
        expect(@record_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
