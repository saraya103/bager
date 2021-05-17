FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 4)}
    count {Faker::Number.number(digits: 2)}
    condition {Faker::Lorem.sentence}
    memo {Faker::Lorem.sentence}
    association :user
    association :note

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/noimg.png'), filename: 'noimg.png')
    end
  end
end
