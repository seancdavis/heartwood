FactoryGirl.define do
  factory :thing do
    name { Faker::Name.name }
  end
end
