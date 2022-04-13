FactoryBot.define do
  factory :customer do
    transient do
      upcased { false }
      orders_count { 3 }
    end

    # name { Faker::Name.name }
    # email { Faker::Internet.email }
    sequence(:name, 'a') { |n| "Customer #{n}" }
    sequence(:email) { |n| "meu_email-#{n}@email.com" }
    address { Faker::Address.street_address }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :with_vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.orders_count, customer: customer)
      end
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end