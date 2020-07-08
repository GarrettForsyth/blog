FactoryBot.define do
  factory :entry do
    title { Faker::Lorem.sentence }
    abstract { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
