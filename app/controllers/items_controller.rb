class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :payment_id, :area_id, :days_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end

