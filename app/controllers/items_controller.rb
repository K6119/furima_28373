class ItemsController < ApplicationController
  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:images, :name, :item_description, :category_id, :item_condition_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
