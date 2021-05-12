FactoryBot.define do
  factory :note do
    character {Faker::Lorem.characters(number: 12)}
    password {Faker::Lorem.characters(number: 6)}
    owner {Faker::Number.number(digits: 4)}
    genre_id {1}
    list_name {Faker::Lorem.sentence}
    log_name {Faker::Lorem.sentence}
    reserve_name {Faker::Lorem.sentence}
    item_name {Faker::Lorem.sentence}
  end
end
