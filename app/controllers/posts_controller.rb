class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]

  def index
    page = params[:page].try(:to_i) || 1
    @next_page = page + 1
    @post_index = page - 1
    @total_pages = Post.calculate_pages
    @posts = Post.paginate(@post_index, page)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @category = Category.find_or_create_by(title: category_params[:category])
    @post = current_user.posts.new(post_params)
    @post.category = @category
    authorize @post
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
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

  def search
    query = params[:query]
    @search_results = Post.search(query)
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def category_params
    params.require(:post).permit(:category)
  end

end
