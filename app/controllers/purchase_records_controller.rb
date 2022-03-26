class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    @purchase_address =PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
       @purchase_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  def purchase_params
    #:number,:exp_month,:exp_year,:cvcのカード情報は保存確認のためpermitを通すために一時的に記述。後に削除すること。
    params.require(:purchase_address).permit( :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
