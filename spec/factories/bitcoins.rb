FactoryBot.define do
  factory :bitcoin do
    trait :set_prices do
      ask   { rand(9000..12000) }
      bid   { rand(9000..12000) }
      last  { rand(9000..12000) }
    end
  end
end