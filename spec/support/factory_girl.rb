require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username){ |n| "user #{n}" }
    sequence(:first_name){ |n| "John #{n}" }
    sequence(:last_name){ |n| "Doe #{n}" }
    location '02474'
    password 'password'
    password_confirmation 'password'
    latitude 42.4232158
    longitude -71.1537637
  end

  factory :backpack do
    sequence(:name) { |n| "model #{n}" }
    sequence(:brand) { |n| "brand #{n}" }
    capacity '50'
    size 'M'
    condition 'Very Good'
    gender 'mens'

    association :user, factory: :user
  end

  factory :tent do
    sequence(:name) { |n| "model #{n}" }
    sequence(:brand) { |n| "brand #{n}" }
    capacity '2'
    use 'Ultra Light'
    condition 'Very Good'

    association :user, factory: :user
  end

end
