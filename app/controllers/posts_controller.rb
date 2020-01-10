class PostsController < ApplicationController
	# load_and_authorize_resource
	# respond_to :html, :xml
	def new
		@post = Post.new
	end

	def create
		byebug
		@post = Post.new(post_params)
		byebug
		@post.save
	end

	def index
		@posts = Post.all
		# respond_to do |format|
  #     format.html
		# 	format.xml { render xml: @posts.to_xml }
		# end
	end

	def show
		@post = Post.find(params[:id])
		# respond_to do |format|
		# 	format.html
		# 	format.js
		# end
		# byebug
	  # if authorize! :show, @post
   #  	redirect_to :back, :alert => "To access this profile, please subscribe here."
   #  end
	end

	def edit
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:name)
	end
end
