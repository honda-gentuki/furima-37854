class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.order("created_at DESC")
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

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :condition_id, :category_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price
    ).merge(user_id: current_user.id)
  end
end
