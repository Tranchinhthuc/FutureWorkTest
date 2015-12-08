FactoryGirl.define do
  factory :story do
    title {Faker::Name.title}
    description {Faker::Lorem.paragraph 2}
    point (1..10).to_a.sample
  end
end
