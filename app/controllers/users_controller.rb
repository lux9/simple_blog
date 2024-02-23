class UsersController < ApplicationController
  def profile
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
end
