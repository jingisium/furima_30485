class PurchasesController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only:[:index]
  before_action :authenticate_user!

  def index
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      @item.update(sold: true)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_index
    if (user_signed_in? && current_user.id == @item.user_id) || @item.sold == true
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_buyer).permit(:post_code, :prefecture_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
