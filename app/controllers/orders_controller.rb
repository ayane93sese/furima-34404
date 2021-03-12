class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_send_order = OrderSendOrder.new
  end

  def create
    @order_send_order = OrderSendOrder.new(order_params)
    if @order_send_order.valid?
      pay_item
      @order_send_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_send_order).permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end
end

