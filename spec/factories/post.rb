FactoryBot.define do
  factory :post do
  	# sequence(:name) { |n| "#{n}"}
  	# post = Post.new
  	name { "5" }
  	# expect(post.check_name1).to eq("test")
  end
end