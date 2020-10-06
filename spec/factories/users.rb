FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    last_name             {Gimei.name.last.kanji}
    first_name            {Gimei.name.first.kanji}
    last_name_kana        {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    date_of_birth         {"2000-01-01"}
  end
end