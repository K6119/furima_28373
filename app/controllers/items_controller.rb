class ItemsController < ApplicationController
  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
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

<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
  # def show
  # end

  # def edit
  # end

>>>>>>> ff2c9251025eccd421dbc5d6e216000f1269231f
  def set_item
    @item = Item.find(params[:id])
  end

<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> ff2c9251025eccd421dbc5d6e216000f1269231f
  def item_params
    params.require(:item).permit(:images, :name, :item_description, :category_id, :item_condition_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end

