FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.sentence}
    description          {Faker::Lorem.sentence}
    category_id          {"2"}
    condition_id         {"2"}
    delivery_charge_id   {"2"}
    send_from_id         {"2"}
    days_for_delivery_id {"2"}
    price                {"300"}

    association          :user

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
