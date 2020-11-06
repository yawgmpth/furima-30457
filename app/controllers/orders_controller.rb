class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :set_order, only: [:index]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(orders_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_order
  @order_form = OrderForm.new
  if current_user.id == @item.user_id
    redirect_to root_path
  elsif @item.order
    redirect_to root_path
  end
end

    
    
    def orders_params
    params.require(:order_form).permit(
      :post_code,
      :delivery_area_id,
      :city,
      :address,
      :building,
      :telephone,
      :order_id
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: orders_params[:token],
      currency: 'jpy'
    )
  end
end
