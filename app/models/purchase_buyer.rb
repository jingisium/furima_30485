class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :street
    validates :phone, format: { with: /\A\d{,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, phone: phone, purchase_id: purchase.id)
  end
end