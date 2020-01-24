class PostsController < ApplicationController
	# load_and_authorize_resource
	# respond_to :html, :xml
	def new
		# debugger
		@post = Post.new
	end

	def create
		# debugger
		@post = Post.new(post_params)
		@post.save
	end

	def index
		# byebug
		@posts = Post.all
		# respond_to do |format|
  #     format.html
		# 	format.xml { render xml: @posts.to_xml }
		# end
	end

	def show
		@post = Post.find(params[:id])
		@comment = @post.comments.build
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

	def update
		# byebug
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to edit_post_path
			flash[:notice] = "updated successfully"
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy!
	end

	private

	def post_params
		params.require(:post).permit(:name, :title)
	end
end
