class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_client = OrderClient.new
    @item = Item.find_by(id: params[:item_id])
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @order_client = OrderClient.new(order_client_params)
    if @order_client.valid?
      pay_item
      @order_client.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def order_client_params
    params.require(:order_client).permit(:post_code, :delivery_address_id, :city, :block, :build, :phone_num).merge(user_id: current_user.id,
                                                                                                               item_id: params[:item_id], token: params[:token])
  end

  def pay_item 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_client_params[:token],
      currency: 'jpy'
    )
  end


end
