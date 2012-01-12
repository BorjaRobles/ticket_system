FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password '1234567'
    sequence(:name) {|n| "elnombre#{n}"}
    sequence(:username) {|n| "elusername#{n}"}
  end

  factory :admin, :class => :user do
    sequence(:email) {|n| "admin#{n}@example.com" }
    password '1234567'
    sequence(:name) {|n| "admin#{n}"}
    sequence(:username) {|n| "admin#{n}" }
    soporte true
  end
end