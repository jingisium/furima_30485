class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :days_for_delivery,
                         :delivery_charge, :send_from

  with_options presence: true do
    validates :title
    validates :title
    validates :description
    validates :category
    validates :condition
    validates :days_for_delivery
    validates :delivery_charge
    validates :send_from
  end
  
  validates :price, presence: true, 
            numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  with_options presence: true, numericality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :days_for_delivery_id
    validates :delivery_charge_id
    validates :send_from
  end
end
