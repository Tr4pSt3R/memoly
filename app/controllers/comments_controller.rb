class CommentsController < ApplicationController
	before_filter :authenticate_user!
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])

		@comment.save
		redirect_to @post
	end

	def destroy
	end
end
