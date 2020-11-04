class OrdersController < ApplicationController

  def index
  @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(orders_params)
    @order_form .save
    redirect_to root_path
  end 

  private

  def orders_params
    params.require(:order_form).permit(
      :post_code,
      :delivery_area_id, 
      :city,
      :address,
      :building,
      :telephone,
      :order_id
      ).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end