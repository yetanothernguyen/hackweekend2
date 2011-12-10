# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user_id 1
    goal_id 1
    content "MyString"
  end
end
