FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user-#{n}@lessneglect.com" }
    password "asdfasdf"
  end

end