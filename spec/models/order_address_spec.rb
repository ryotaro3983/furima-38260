require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it 'すべての情報が正しく入力されている' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'ユーザーの紐付けがないと登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'カード情報(token)が生成できていないと登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが数値のみだと登録できない' do
        @order.postal_code = '0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeの数値が全角だと登録できない' do
        @order.postal_code = '０００-００００'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが初期値だと保存できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに数値以外が含まれると登録できない' do
        @order.phone_number = '090-1111-2222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order.phone_number = '090111222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order.phone_number = '090111122223'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが半角数値以外だと登録できない' do
        @order.phone_number = '０９０１１１１２２２２'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
