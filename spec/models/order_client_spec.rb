require 'rails_helper'
RSpec.describe OrderClient, type: :model do
  before do
    # 親モデルのインスタンスを生成
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    # 親モデルのインスタンスからIdを取得
    @order_client = FactoryBot.build(:order_client, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入' do
    context '商品を購入できる' do
      it '全ての入力項目が存在すれば購入できる' do
        puts @order_client.errors.full_messages
        expect(@order_client).to be_valid
      end
      it '建物名が未入力でも購入できる' do
        @order_client.build = ''
        expect(@order_client).to be_valid
      end
    end

    context '商品を購入できない' do
      it 'ユーザーIDが空であれば購入できない' do
        @order_client.user_id = nil
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("User can't be blank")
      end
      it 'アイテムIDが空であれば購入できない' do
        @order_client.item_id = nil
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @order_client.post_code = ''
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角ハイフンを含む形でなければ購入できない' do
        @order_client.post_code = '1111111'
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Post code is invalid")
      end
      it 'delivery_address_idが「---」では購入できない' do
        @order_client.delivery_address_id = 1
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Delivery address can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_client.city = ''
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_client.block = ''
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @order_client.phone_num = ''
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numに半角数字以外が含まれていれば購入できない' do
        @order_client.phone_num = '111-111-1111'
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numが9桁以下では購入できない' do
        @order_client.phone_num = '1111'
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numが12桁以上では購入できない' do
        @order_client.phone_num = '111111111111'
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include('Phone num is invalid')
      end
      it 'tokenが空では購入できない' do
        @order_client.token = nil
        @order_client.valid?
        expect(@order_client.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
