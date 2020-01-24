FactoryBot.define do
  factory :post do
  	sequence(:name) { |n| "#{n}"}
  end
end