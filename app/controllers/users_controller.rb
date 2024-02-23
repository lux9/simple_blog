class UsersController < ApplicationController
  before_action :check_admin, only: [:admin]
    
  def profile
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def admin
    @posts = Post.all.order(created_at: :desc)
  end

  private

  def check_admin
    redirect_to(root_url) unless current_user && current_user.admin?
  end
end
