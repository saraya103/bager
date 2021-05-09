FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    nickname {Faker::Name.initials}
  end
end
