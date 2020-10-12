require 'rails_helper'

RSpec.describe "購入記録と配送先情報の登録", type: :model do
  
  before do
    @purchase_buyer = FactoryBot.build(:purchase_buyer)
  end

  context "情報が保存できる時" do
    it "全ての情報が入力されていると保存できる" do
      expect(@purchase_buyer).to be_valid
    end
    it "建物名のみが空だと保存できる" do
      @purchase_buyer.building = nil
      expect(@purchase_buyer).to be_valid
    end
  end

  context "情報が保存できない時" do
    it "tokenが空だと保存できない" do
      @purchase_buyer.token = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空だと保存できない" do
      @purchase_buyer.post_code = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Post code can't be blank")
    end
    it "郵便番号にハイフンが無いと保存できない" do
      @purchase_buyer.post_code = "1234567"
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Post code is invalid")
    end
    it "都道府県が空だと保存できない" do
      @purchase_buyer.prefecture_id = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "都道府県が「--」を選択されていると保存できない" do
      @purchase_buyer.prefecture_id = "1"
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "番地が空だと保存できない" do
      @purchase_buyer.street = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Street can't be blank")
    end
    it "電話番号が空だと保存できない" do
      @purchase_buyer.phone = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Phone can't be blank")
    end
    it "電話番号にハイフンがあると保存できない" do
      @purchase_buyer.phone = "090-1234-1234"
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Phone is invalid")
    end
    it "電話番号が12桁以上だと保存できない" do
      @purchase_buyer.phone = "090123412341"
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Phone is invalid")
    end
    it "ユーザーが紐づいていないと保存できない" do
      @purchase_buyer.user_id = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
    end
    it "商品が紐づいていないと保存できない" do
      @purchase_buyer.item_id = nil
      @purchase_buyer.valid?
      expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
    end
  end
end