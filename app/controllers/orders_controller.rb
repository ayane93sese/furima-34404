class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_send_order = OrderSendOrder.new
  end
  
  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_send_order = OrderSendOrder.new(order_params)
    if @order_send_order.valid?
      @order_send_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_send_order).permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
    #params.permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end

