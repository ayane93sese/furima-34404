require 'rails_helper'

RSpec.describe OrderSendOrder, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_send_order = FactoryBot.build(:order_send_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context "購入情報が保存できる場合" do
      it "全ての値が正しく入力されていれば保存ができる" do
        expect(@order_send_order).to be_valid
      end
      it "buildingは空でも保存できる" do
        @order_send_order.building = ""
        expect(@order_send_order).to be_valid
      end
      it "buildingは空でも保存できる" do
        @order_send_order.building = ""
        expect(@order_send_order).to be_valid
      end
    end
    context "購入情報が保存できない場合" do
      it "tokenが空だと保存できない" do
        @order_send_order.token = nil
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと保存できない" do
        @order_send_order.postal_code = ''
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
        @order_send_order.postal_code = '1234567'
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Postal code Input correctly")
      end
      it "area_idを1以外で選択していないと保存できない" do
        @order_send_order.area_id = 1
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Area Select")
      end
      it "cityが空だと保存できない" do
        @order_send_order.city = ""
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと保存できない" do
        @order_send_order.address = ""
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと保存できない" do
        @order_send_order.phone_number = ""
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角だと登録できない" do
        @order_send_order.phone_number = "０９０１２３４５６７８"
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが数字以外だと登録できない" do
        @order_send_order.phone_number = "電話番号"
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが12桁以上だと登録できない" do
        @order_send_order.phone_number = "080123456789"
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberが英数混合だと登録できない" do
        @order_send_order.phone_number = "o8ol2345b78"
        @order_send_order.valid?
        expect(@order_send_order.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
