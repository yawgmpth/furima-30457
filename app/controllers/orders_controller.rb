class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
  @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(orders_params)
    if @order_form.valid?
        @order_form.save
    redirect_to root_path
   else
    render :index
  end 
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
   
    def set_item
      @item = Item.find(params[:item_id])
    end

  end