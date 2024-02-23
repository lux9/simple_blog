require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
    @user = users(:one)
    @comment = Comment.new(content: "Valid Content", post: @post, user: @user)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should belong to post" do
    assert_not_nil @comment.post
  end

  test "should belong to user" do
    assert_not_nil @comment.user
  end

  test "content should be present" do
    @comment.content = "  "
    assert_not @comment.valid?
  end

  test "should not be valid without to user" do
    @comment.user = nil
    assert_not @comment.valid?
  end

  test "should not be valid without to post" do
    @comment.post = nil
    assert_not @comment.valid?
  end
end
