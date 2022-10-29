require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品出品ができるとき' do
      it 'すべての情報が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'nameが空だと登録できない' do
        
      end
      it 'textが空だと登録できない' do
        
      end
      it 'imageが空だと登録できない' do
        
      end
      it 'priceが空だと登録できない' do
        
      end
      it 'priceが半角数値以外だと登録できない' do
        
      end
      it 'priceが299以下では登録できない' do

      end
      it 'priceが10000000以上では登録できない'
      it 'categoryが空だと登録できない' do
        
      end
      it 'categoryが初期値(___)だと登録できない' do
        
      end
      it 'conditionが空だと登録できない' do
        
      end
      it 'conditionが初期値(___)だと登録できない' do
        
      end
      it 'delivery_feeが空だと登録できない' do
        
      end
      it 'delivery_feeが初期値(___)だと登録できない' do
        
      end
      it 'prefectureが空だと登録できない' do
        
      end
      it 'prefectureが初期値(___)だと登録できない' do
        
      end
      it 'delivery_dayが空だと登録できない' do
        
      end
      it 'delivery_dayが初期値(___)だと登録できない' do
        
      end
    end
  end
end
