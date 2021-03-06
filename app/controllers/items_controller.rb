class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user, :purchase_record).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.purchase_record.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :schedule_delivery_id, {images: []}).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
