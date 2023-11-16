FactoryBot.define do
  factory :dummy do
    name { "MyString" }
    age { 21 } # age { rand(1..100) }
    born_at { "2023-10-27 09:18:25" }
    # email { "anil@gmail.com" }
    sequence(:email) { |n| "anil+#{n}@gmail.com" }
  end
end
