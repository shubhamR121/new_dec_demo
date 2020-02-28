class PostsController < ApplicationController
	# load_and_authorize_resource
	# respond_to :html, :xml
	def new
		# debugger
		@post = Post.new
		
	  4.times do
    @comments = @post.comments.build
    # 4.times { question.answers.build }
  	end
	end

	def create
		@post = Post.new(post_params)
		@post.save
		SendNotificationsJob.perform_now(current_user)
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
		params.require(:post).permit(:name, :title, comments_attributes: [:id, :name])
	end
end
