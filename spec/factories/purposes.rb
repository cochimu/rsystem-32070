FactoryBot.define do
  factory :purpose do
    content {Faker::Food.fruits}
    association :user
  end
end
