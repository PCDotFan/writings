FactoryGirl.define do
  factory :space do
    sequence(:name){|n| "spacename#{n}" }
    after(:create) do |instance|
      user = FactoryGirl.create(:user)
      instance.add_creator(user)
    end
  end
end
