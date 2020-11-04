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
