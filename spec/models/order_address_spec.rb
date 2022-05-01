require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空の場合でも保存できること' do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できる場合' do
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ購入できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空では購入できない' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁以上11桁以内の半角数値のみでなければ購入できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number must be at least 10 and no more than 11 single-byte digits')
      end

      it 'token が空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
