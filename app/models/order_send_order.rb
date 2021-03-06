class OrderSendOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number, :item_id, :user_id

  attr_accessor :token
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を正しく入力してください"}
    validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "は半角数字のみで入力してください"}, length: {maximum: 11}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendOrder.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
