require 'rails_helper'
require 'spec_helper'
require 'devise'
require 'factories/post'
require 'factories/comment'
require 'factories/user'
require 'rspec/rails'

RSpec.feature "Posts", type: :feature do

		let!(:user) { FactoryBot.create(:user) }
	  before(:each) do
	    sign_in user
	  end

		describe "GET post#new" do 
			let!(:posts) { FactoryBot.create(:post)}
			it "visit form, fill values and create post" do
	  		visit new_post_path
				page.select posts.name, :from => "test"
				# byebug
				fill_in posts.title, with: "title test"
				expect { click_button "Create Post" }.to change(Post, :count).by(1)
	  	end
	  end

		describe "GET post#edit" do 
			let!(:posts) { FactoryBot.create(:post)}
			it "visit form, fill values and update post" do
	  		visit edit_post_path(posts.id)
				page.select posts.name, :from => "post_name"
				click_button "Update Post"
				expect(page).to have_css(".alert", text: "updated successfully")
	  	end
	  end

	  describe "GET post#show" do 
			let!(:posts) { FactoryBot.create(:post)}
			let!(:comment) { FactoryBot.create(:comment, post_id: posts.id )}
			it "visit form, fill values and create post" do
	  		visit post_path(posts.id)
	  		expect(page).to have_css(".post", text: posts.name)
	  		expect(page).to have_css(".show", text: posts.comments.first.name)
	  		fill_in "comment[name]", with: "name"
	  		expect(find(".post_id", :visible => false).value).to eq("1")
	  		# byebug
	  		expect { click_button "Create Comment" }.to change(Comment, :count).by(1)
	  	end
	  end

	  describe "GET root" do
	  	let!(:posts) { FactoryBot.create(:post)}
	  	# let!(:current_user) { FactoryBot.create :user }
	  	# let!(:test_user) { FactoryBot.create :user }
	  	it "it should test root path" do
	  		visit root_path
	  		expect(page).to have_css(".posts", text: posts.name)
	  		expect(page).to have_css(".card-title", text: posts.name)
				# byebug
	  	end
	  end
end
