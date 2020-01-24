FactoryBot.define do
  factory :comment do
  	name { "comment 1" }
  	post_id { FactoryBot.create :post } 
  end
end