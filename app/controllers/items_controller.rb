class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit( :name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture, :schedule_delivery_id, :image).merge(user_id: current_user.id)
  end
end
