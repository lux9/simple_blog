class UsersController < ApplicationController
  def profile
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def admin
    @posts = Post.all.order(created_at: :desc)
  end
end
