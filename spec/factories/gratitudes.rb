FactoryBot.define do
  factory :gratitude do
    user_id { Faker::Number.between(from: 1, to: 100) }
    entry { Faker::Quote.mitch_hedberg }
    date { Faker::Date.between(from: Date.today, to: Date.today) }
  end
end