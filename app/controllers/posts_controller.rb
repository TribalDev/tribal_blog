class PostsController < ApplicationController

  def index
    page = params[:page].try(:to_i) || 1
    @next_page = page + 1
    @post_index = page - 1
    @total_pages = Post.calculate_pages
    @posts = Post.limit(25).offset(@post_index * 10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
