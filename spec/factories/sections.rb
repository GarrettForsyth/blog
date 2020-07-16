FactoryBot.define do
  factory :section do
    content { Faker::Lorem.sentence }
    association :entry, factory: :entry
  end
end
