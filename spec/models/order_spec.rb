require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'すべて情報を適切に入力すれば保存できる' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'zipが空では保存できない' do
        @order.zip = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'zipは3桁ハイフン4桁でないと保存できない' do
        @order.zip = '1234-1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end
      it 'zipはハイフンがないと保存できない' do
        @order.zip = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end
      it 'zipは半角文字列でないと保存できない' do
        @order.zip = '123ー1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end
      it 'phone_numberが10桁未満では保存できない' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number of characters is 10 to 11 and not include hyphen(-)")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order.phone_number = '123422343234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number of characters is 10 to 11 and not include hyphen(-)")
      end
      it 'phone_numberは数値でないと保存できない' do
        @order.phone_number = '080-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number of characters is 10 to 11 and not include hyphen(-)")
      end
      it 'phone_numberは半角でないと保存できない' do
        @order.phone_number = '０１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number of characters is 10 to 11 and not include hyphen(-)")
      end
    end
  end
end