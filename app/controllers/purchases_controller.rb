class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

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
