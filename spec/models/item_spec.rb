require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context 'ユーザーが商品を出品できるとき' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context 'ユーザーが商品を出品できないとき' do
      it '商品画像が無ければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が空では出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元地域の地域の情報が空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数の情報が空では出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格の情報が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
