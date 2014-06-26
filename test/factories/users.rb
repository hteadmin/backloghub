# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "account@tutudumonde.com"
    password "secret"
  end
end
