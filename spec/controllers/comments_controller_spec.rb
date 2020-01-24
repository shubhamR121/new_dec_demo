

require "rails_helper"
require "spec_helper"
require 'factories/post'
require 'factories/comment'



RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user
  end
	describe "POST #create" do 
		# let(:comment) { FactoryBot.create :comment}
		let(:posts) { FactoryBot.create :post }
		# let(:posts) { FactoryBot.create :post }
		context "create comment" do
			it "it should create comment and return success status" do 
				# byebug
				post :create, params: { comment: { name: "comment 1" , post_id: posts.id } }
				expect(Comment.all.count).to eq(1)
				expect(response).to redirect_to(post_path(posts.id))
				expect(flash[:notice]).to match(/Comment created Successfully!/)
			end
		end
	end
end