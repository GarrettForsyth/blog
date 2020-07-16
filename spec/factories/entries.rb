FactoryBot.define do
  factory :entry do
    title { Faker::Lorem.sentence }
    abstract { Faker::Lorem.paragraph }
    after(:create) do |entry|
      rand(6).times { entry.sections << FactoryBot.create(:section, entry: entry) }
    end
  end
end
