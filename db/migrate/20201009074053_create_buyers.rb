class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :post_code,      default: "", null: false
      t.integer :prefecture_id, null: false
      t.string :city,           default: "", null: false
      t.text :street,           null: false
      t.text :building
      t.string :phone,          default: "", null: false
      t.references :purchase,   foreign_key: true
      t.timestamps
    end
  end
end
