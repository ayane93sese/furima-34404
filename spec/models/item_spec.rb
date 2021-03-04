require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品新規登録" do
    context "新規登録できるとき" do
      it "image、title、textが存在し、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数が選択されて、priceが300〜9999999の間で入力されていれば登録できる" do
        expect(@item).to be_valid
      end
      it "titleが存在すれば登録できる" do
        @item.title = "abcde"
        expect(@item).to be_valid
      end
      it "textが存在すれば登録できる" do
        @item.text = "test"
        expect(@item).to be_valid
      end
      it "category_idが1以外で選択されていれば登録できる" do
        @item.category_id = "2"
        expect(@item).to be_valid
      end
      it "status_idが1以外で選択されていれば登録できる" do
        @item.status_id = "2"
        expect(@item).to be_valid
      end
      it "payment_idが1以外で選択されていれば登録できる" do
        @item.payment_id = "2"
        expect(@item).to be_valid
      end
      it "area_idが1以外で選択されていれば登録できる" do
        @item.area_id = "2"
        expect(@item).to be_valid
      end
      it "days_idが1以外で選択されていれば登録できる" do
        @item.days_id = "2"
        expect(@item).to be_valid
      end
      it "priceが300〜9999999の間で存在すれば登録できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "status_idが1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "payment_idが1では登録できない" do
        @item.payment_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment Select")
      end
      it "area_idが1では登録できない" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it "days_idが1では登録できない" do
        @item.days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days Select")
      end
      it "priceが300以上でないと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9999999より大きいと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが全角だと登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end

