FactoryGirl.define do
  factory :album do
    sequence(:title) { |n| "Purple Rain #{n}" }
    year "1984"

    artist
  end
end
