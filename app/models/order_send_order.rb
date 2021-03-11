class OrderSendOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :area_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Input only number"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendOrder.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
