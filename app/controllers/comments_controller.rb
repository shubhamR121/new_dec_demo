class CommentsController < ApplicationController
	# def new
	# 	@comment = Comment.new
	# end

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		# byebug
		@comment = Comment.new(comments_params)
		@comment.post_id = params[:comment][:post_id].to_i
		if @comment.save!
			redirect_to post_path(params[:comment][:post_id].to_i)
			flash[:notice] = "Comment created Successfully!"
		end
	end

	private

	def comments_params
		params.require(:comment).permit(:name)
	end
end
