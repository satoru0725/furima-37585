require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が投稿できる場合' do
      it '9項目全てを記述すると投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報が投稿できない場合' do
      it '商品画像が空では投稿できない' do
      end
      it '商品名が空では投稿できない' do
      end
      it '商品の説明が空では投稿できない' do
      end
      it 'カテゴリーの情報が未選択だと投稿できない' do
      end
      it '商品の状態の情報が未選択だと投稿できない' do
      end
      it '商品の状態の情報が未選択だと投稿できない' do
      end
      it '配送料の負担の情報が未選択だと投稿できない' do
      end
      it '発送元の地域の情報が未選択だと投稿できない' do
      end
      it '発送までの日数の情報が未選択だと投稿できない' do
      end
      it '価格の情報が未選択だと投稿できない' do
      end
      it '価格の数値が¥300未満だと投稿できない' do
      end
      it '価格の数値が¥9999999より大きいと投稿できない' do
      end
      it '価格の情報が全角だと投稿できない' do
      end
      it '価格の情報が半角英字だと投稿できない' do
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
      end
    end
  end
end
