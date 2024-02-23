class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.text { render partial: "comments/comment", locals: { comment: @comment }, formats: [:html] }
        # format.text { render partial: "comments/list", locals: { post: @comment.post }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.text { render plain: "Error saving comment", status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was edited created.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_params
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
