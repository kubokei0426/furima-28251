require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、
          first_nameとlast_name、
          first_name_kanaとlast_name_kana、
          birth_dateが存在すれば登録できる" do
          expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "太朗"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("eメールはすでに存在します")
      end

      it "emailに@が存在しない場合登録できない" do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("eメールは不正な値です")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("再入力パスワードとパスワードの入力が一致しません")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（フリガナ）を入力してください")
      end

      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（フリガナ）は不正な値です")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）を入力してください")
      end

      it "last_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）は不正な値です")
      end

    end
  end
end