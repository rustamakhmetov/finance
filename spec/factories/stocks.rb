FactoryGirl.define do
  sequence :name do |n|
    "Stock #{n}"
  end

  factory :stock do
    name
  end
end
