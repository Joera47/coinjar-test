FactoryBot.define do
  factory :ethereum do
    trait :set_prices do
      ask 	{ rand(100..300) }
      bid 	{ rand(100..300) }
      last 	{ rand(100..300) }
    end
  end
end