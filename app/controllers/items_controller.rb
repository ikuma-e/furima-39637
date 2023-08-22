class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :state_id, :delivery_price_id, :delivery_address_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

end
