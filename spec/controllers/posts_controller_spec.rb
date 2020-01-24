require "rails_helper"
require 'factories/post'
require 'factories/user'


RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user
  end
  # describe "Initialize an post" do
  #   context "NEW #new" do
  #     it "it should initialize an post" do 
  #       visit new_post_path
  #       fill_in "name", with: "new post"
  #       expect { click_button 'Create Post' }.to change(Post, :count).by(1)
  #       # expect(assigns(:post)).to be_a_new(Post)
  #     end
  #   end
  # end
  
  describe "posts controller request specs" do
    context "GET #index" do
      before(:each) do
        sign_in user
      end
      it "list all posts" do
        # byebug
        get :index
        @posts = create_list(:post, 10)
        expect(response).to have_http_status(:success)
        # @posts.each do |post|
        #   page.should have_content(post.name)
        # end
      end
    end
  end


  describe "posts controller request specs" do
    context "POST #create" do
      let!(:posts) { FactoryBot.create :post }
      it "list all posts" do
        # byebug
        # get :create
        params = { name: "post 1" }
        expect { post(:create, params: {post: params} )}.to change(Post, :count).by(1)
      end
    end
  end

  describe "posts controller request specs" do 
    let!(:posts) { FactoryBot.create :post }
    context "PUT #update" do 
      it "it should update post" do
        # byebug
        params = { name: "post 2" }
        put :update, params: { id: posts.id, post: params }
        # byebug
        posts.reload

        params.keys.each do |key|
          # byebug
          expect(posts.attributes[key.to_s]).to eq params[key]
          # expect(response).to have_http_status(:success)
        end
      end
    end

    context "with good data" do
      it "update post and redirect it" do
        # byebug
        params = { name: "post 2" }
        put :update, params: { id: posts.id, post: params }
        expect(response).to be_redirect
      end
    end

    context "with bad data" do
      it "neither update post nor redirect it" do
        # byebug
        params = { name: nil }
        put :update, params: { id: posts.id, post: params }
        expect(response).not_to be_redirect
      end
    end
  end

  describe "DELETE #destroy" do
    context "for valid data" do
      let!(:posts) { FactoryBot.create :post }
      it "destroy an post" do
        params = { name: "post 2" }
        # delete :destroy, params: { id: posts.id, post: params}
        # byebug
        expect { delete(:destroy, params: {id: posts.id, post: params} )}.to change(Post, :count).by(-1)
        # expect { delete :destroy, params: { id: product.id } }.to change(Product, :count).by(-1)
      end
    end
  end

  describe "GET #show" do
    let!(:posts) { FactoryBot.create(:post) }
    it "show a post" do
      get :show, params: { id: posts.id }
      expect(response).to have_http_status(:success) 
    end
  end

end