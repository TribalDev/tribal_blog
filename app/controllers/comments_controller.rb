class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.build(comment_params.merge(post: @post))
		@comment.save!
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private
	def comment_params
		params[:comment].permit(:body)
	end

end
