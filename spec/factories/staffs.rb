FactoryBot.define do
  factory :staff do
    name {Faker::Name.name}
    association :user
  end
end
