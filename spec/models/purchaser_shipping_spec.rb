require 'rails_helper'

RSpec.describe PurchaserShipping, type: :model do
  describe '購入情報の保存' do
    before do
      @purchaser_shipping = FactoryBot.build(:purchaser_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchaser_shipping).to be_valid
    end
    it 'prefecture_idが空だと保存できないこと' do
      @purchaser_shipping.prefecture_id = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Prefectureは数値で入力してください")
    end
    it 'prefecture_idがid:1だと保存できない' do
      @purchaser_shipping.prefecture_id = 1
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Prefectureは1以外の値にしてください")
    end
    it 'cityが空だと保存できないこと' do
      @purchaser_shipping.city = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Cityを入力してください")
    end
    it 'addressesが空だと保存できないこと' do
      @purchaser_shipping.addresses = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Addressesを入力してください")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchaser_shipping.phone_number = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Phone numberは不正な値です")
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchaser_shipping.postal_code = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Postal codeを入力してください")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchaser_shipping.postal_code = '1234567'
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Postal codeは不正な値です")
    end
    
  end
end