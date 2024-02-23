class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc), items: 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: 'Post was edited created.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
