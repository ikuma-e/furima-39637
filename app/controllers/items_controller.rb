class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :state_id, :delivery_price_id,
                                 :delivery_address_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  # 重複のためIdからデータを探す処理をまとめる
  def set_item
    @item = Item.find(params[:id])
  end
  # ログインユーザーが出品者でない場合、強制的にトップページに移動させる
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end
