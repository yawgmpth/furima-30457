class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @item = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end


  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def items_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :delivery_cost_id,
      :delivery_area_id,
      :delivery_day_id,
      :price
    ).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end
