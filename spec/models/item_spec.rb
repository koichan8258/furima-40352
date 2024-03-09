require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '必要な情報を適切に入力すると、出品できる' do
        user = FactoryBot.create(:user)
        @item = FactoryBot.build(:item, user_id: user.id)
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'explainが1000文字を超えていると登録できない' do
        @item.explain = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Explain is too long (maximum is 1000 characters)')
      end

      it 'category_idが1（"--"）では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situation_idが1（"--"）では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'delivery_charge_idが1（"--"）では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'prefecture_idが1（"--"）では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが1（"--"）では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが300円未満では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it 'selling_priceが9,999,999円より大きい場合は登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end

      it 'selling_priceが全角数字だと登録できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが半角英字だと登録できない' do
        @item.selling_price = 'three hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end
