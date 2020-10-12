FactoryBot.define do
  factory :purchase_buyer do
    token         {"tok_abcdefghijk00000000000000000"}
    post_code     {"123-4567"}
    prefecture_id {"2"}
    city          {Gimei.address.city.kanji}
    street        {"中央区1-1-1"}
    building      {"中央ビル101号室"}
    phone         {Faker::Number.number(digits:11)}
    item_id       {"1"}
    user_id       {"1"}
  end
end
