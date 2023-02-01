FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    avatar { "#{Rails.root}/spec/fixtures/avatar.png" }
    smoker { %w[S N].sample }
  end
end
