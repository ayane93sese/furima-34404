class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :payment_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

end

