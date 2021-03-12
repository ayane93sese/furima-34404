FactoryBot.define do
  factory :order_send_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    area_id {2}
    city {'北区'}
    address {'赤羽1-1'}
    building {'東京ハイツ'}
    phone_number {'05012345678'}
    association :item
    association :user
  end
end


