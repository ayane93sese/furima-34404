require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nicknameとemail、passwordとpassword_cofirmation、ユーザー本名の苗字と名前、ユーザー本名のフリガナの苗字と名前、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが存在すれば登録できる" do
        @user.nickname = 'test123'
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが半角英数6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "family_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "山田"
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "family_name_rubyとfirst_name_rubyが全角（カタカナ）であれば登録できる" do
        @user.family_name_ruby = "ヤマダ"
        @user.first_name_ruby = "タロウ"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailは@がないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが存在しても、password_confirmationが空では登録できない" do

        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数で入力してください")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数で入力してください")
      end
      it "passwordが全角では登録できない" do
        @user.password = "１２３ＡＢＣ"
        @user.password_confirmation = "１２３ＡＢＣ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数で入力してください")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "family_name_rubyが空では登録できない" do
        @user.family_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナを入力してください")
      end
      it "first_name_rubyが空では登録できない" do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it "Family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力してください")
      end
      it "First_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it "Family_name_rubyが全角（カタカナ）でなければ登録できない" do
        @user.family_name_ruby = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナは全角カナで入力してください")
      end
      it "First_name_rubyが全角（カタカナ）でなければ登録できない" do
      @user.first_name_ruby = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナは全角カナで入力してください")
      end
      it "birthが空では登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end

