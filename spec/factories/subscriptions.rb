FactoryBot.define do
  factory :subscription do
    customer
    tea
    title { "My #{Faker::Tea.variety} Subscription" }
    price { Faker::Number.decimal(r_digits: 2) }
    status { [0, 1].sample }
    frequency { [0, 1, 2].sample }
  end
end
