require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー登録できる時" do
    it "ニックネーム、メールアドレス、パスワード（2回）、本名、フリガナ、生年月日が全て存在していれば登録できる" do
      expect(@user).to be_valid
    end
  end

  context "ユーザー登録できない時" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが@を含んでいないと登録できない" do
      @user.email = "aaaaaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailを用いると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = "abcd5"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが英字のみだと登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationがpasswordと一致していないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが英字だと登録できない" do
      @user.last_name = "Brown"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが英字だと登録できない" do
      @user.first_name = "Tom"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaがカタカナ以外だと登録できない" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaがカタカナ以外だと登録できない" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "date_of_birthが空だと登録できない" do
      @user.date_of_birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end