FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "Prince - #{n}" }
  end
end
