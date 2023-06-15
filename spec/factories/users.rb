FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials }
    email                    { Faker::Internet.free_email }
    password                 { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
 