require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@order_address).to be_valid
      end
    end
  end
end
