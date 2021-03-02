FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {Faker::Internet.free_email}
    password {"test00"}
    password_confirmation {password}
    family_name {'田中'}
    first_name {'花子'}
    family_name_ruby {'タナカ'}
    first_name_ruby {'ハナコ'}
    birth {'1993-01-01'}
  end
end
