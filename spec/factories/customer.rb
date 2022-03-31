FactoryBot.define do
  factory :customer do
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }

    factory :customer_with_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end