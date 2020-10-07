require 'rails_helper'

RSpec.describe "商品出品機能", type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  context "商品が保存できる時" do
    it "画像、商品名、説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が全て存在するならば保存できる" do
      expect(@item).to be_valid
    end
  end

  context "商品が保存できない時" do
    it "商品画像が無いと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空だと保存できない" do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品の説明が空だと保存できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリーが空だと保存できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空だと保存できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "配送料の負担が空だと保存できない" do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it "発送元の地域が空だと保存できない" do
      @item.send_from_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Send from can't be blank")
    end
    it "発送までの日数が空だと保存できない" do
      @item.days_for_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days for delivery can't be blank")
    end
    it "価格が空だと保存できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が300円未満だと登録できない" do
      @item.price = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格が9,999,999円を超えていると保存できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "価格が全角数字だと保存できない" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
