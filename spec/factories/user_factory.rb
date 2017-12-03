FactoryBot.define do
	sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email 
    password "sslj9k00"
    first_name "D"
    last_name "C"
    admin false

    factory :admin, class: User do

    email 
    password "sslj9k"
    first_name "Dave"
    last_name "Colozzi"
    admin true
  end
end