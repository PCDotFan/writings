FactoryGirl.define do
  factory :order do
    space
    plan Enum::Plan::BASE
    quantity 1
    price 20
  end
end
