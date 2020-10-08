class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id,
                                 :condition_id, :days_for_delivery_id, :delivery_charge_id,
                                 :send_from_id, :price, :image).merge(user_id: current_user.id)
  end
end
