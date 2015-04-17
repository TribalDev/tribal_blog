class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    respond_to @posts
  end
  
  def show
    @post = Post.find(params[:id])
    respond_to @post
  end
  
end
