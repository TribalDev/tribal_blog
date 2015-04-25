class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.build(comment_params.merge(post: @post))
		authorize @comment
		@comment.save!
		redirect_to post_path(@post)
	end

	 def edit
		@post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
		authorize @comment
  end

  def update
		@post = Post.find(params[:post_id])
  	@comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		authorize @comment
		@comment.destroy

		redirect_to post_path(@post)
	end

	private
	def comment_params
		params[:comment].permit(:body)
	end

end
