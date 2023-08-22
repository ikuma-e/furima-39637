require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できる' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録できない' do
      it 'ユーザーが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end

      it 'category_idが「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end

      it 'state_idが「---」では登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("State can't be blank")
      end

      it 'delivery_price_idが「---」では登録できない' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery price can't be blank")
      end

      it 'delivery_address_idが「---」では登録できない' do
        @item.delivery_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery address can't be blank")
      end
      it 'delivery_time_idが「---」では登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery time can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it 'priceが9999999より大きい値では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
    end
  end

end
