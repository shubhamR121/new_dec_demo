require 'rails_helper'
require 'factories/post'


RSpec.describe Post, :type => :model do

  subject(:post) { Post.new }
  


  it "is valid with valid attributes" do
    post.name = "test"
    post.title = "title"
  	expect(post).to be_valid
  end

  it "is not valid with valid attributes" do
    post.name = nil
  	expect(post).to_not be_valid
  end

  it "is valid without a title" do
    post.title = nil
    expect(post).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:comments) }
  end

  context "validations" do
    it { should validate_presence_of(:name) } #use this with it 
    # it { should allow_value("user@example.com").for(:email) }
    # it { should_not allow_value("not-an-email").for(:email) }
  end

  context "test methods" do
    subject(:post) { Post.new(name: "post 1") }
    it "compares the name" do
      expect(post.check_name).to eq(true)
    end
  end

  context "test methods" do
    subject(:post) { Post.new(name: "post 1") }
    it "compares the name" do
      expect(post.check_length).to eq(true)
    end
  end
  # it "is not valid without a description"
  # it "is not valid without a start_date"
  # it "is not valid without a end_date"
end