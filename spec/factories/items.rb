FactoryBot.define do
  factory :item do
    content {Faker::Food.dish}
    association :user
  end
end
