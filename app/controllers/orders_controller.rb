class OrdersController < ApplicationController

  def index
  @order_form = OrderForm.new
  end

  def create
  @order_form = OrderForm.new(order_prams)
  end 

  private

  def orders_params
    params.require(:order).permit(
      :post_code,
      :prefectures_id, 
      :city,
      :address,
      :building,
      :telephone,
      :order_id
      ).merge(item_id: current_user.id)
  end
end