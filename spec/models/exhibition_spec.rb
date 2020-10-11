require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  before do
    @exhibition = FactoryBot.build(:exhibition)
  end

  describe '出品の保存' do
    context '出品が保存できる場合' do
      it '出品画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と販売価格があれば出品は保存される' do
        expect(@exhibition).to be_valid
      end
    end
    context '出品が保存できない場合' do
      it '出品画像がないと出品は保存できない' do
        @exhibition.image = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('画像を入力してください')
      end
      it '商品名がないと出品は保存できない' do
        @exhibition.name = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品説明がないと出品は保存できない' do
        @exhibition.text = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('商品説明を入力してください')
      end
      it 'カテゴリーがないと出品は保存できない' do
        @exhibition.category_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'カテゴリーがid:1だと出品は保存できない' do
        @exhibition.category_id = 1
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it '商品状態がないと出品は保存できない' do
        @exhibition.status_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('商品状態を入力してください')
      end
      it '商品状態がid:1だと出品は保存できない' do
        @exhibition.status_id = 1
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('商品状態は1以外の値にしてください')
      end
      it '配送料がないと出品は保存できない' do
        @exhibition.fee_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('配送料を入力してください')
      end
      it '配送料がid:1だと出品は保存できない' do
        @exhibition.fee_id = 1
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('配送料は1以外の値にしてください')
      end
      it '発送元地域がないと出品は保存できない' do
        @exhibition.prefecture_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('発送元地域を入力してください')
      end
      it '発送元地域がid:1だと出品は保存できない' do
        @exhibition.prefecture_id = 1
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('発送元地域は1以外の値にしてください')
      end
      it '発送日数がないと出品は保存できない' do
        @exhibition.delivery_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('発送日数を入力してください')
      end
      it '発送日数がid:1だと出品は保存できない' do
        @exhibition.delivery_id = 1
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('発送日数は1以外の値にしてください')
      end
      it '販売価格がないと出品は保存できない' do
        @exhibition.price = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('販売価格を入力してください')
      end
      it '販売価格が全角だと出品は保存できない' do
        @exhibition.price = '３００'
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '販売価格が300未満だと出品は保存できない' do
        @exhibition.price = 299
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '販売価格が10,000,000以上だと出品は保存できない' do
        @exhibition.price = 10_000_000
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('販売価格は10000000より小さい値にしてください')
      end
      it 'ユーザーが紐付いていないと出品は保存できない' do
        @exhibition.user = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
