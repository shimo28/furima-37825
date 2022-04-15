require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録できる場合' do
      it "必要な情報を適切に入力すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない場合' do
      it "titleが空では登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_burden_idが空では登録できない" do
        @item.shipping_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end
      it "delivery_day_idが空では登録できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "category_idが1では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_burden_idが1では登録できない" do
        @item.shipping_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end
      it "delivery_day_idが1では登録できない" do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "priceが300以下では登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999以上では登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが数字でないと登録できない" do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角でないと登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
