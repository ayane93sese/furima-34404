FactoryBot.define do
  factory :item do
    title {"test"}
    text {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    payment_id {2}
    area_id {2}
    days_id {2}
    price {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

