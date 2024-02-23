require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = Post.new(title: "Valid Title", body: "Valid body content", user: @user)
  end
  
  test "should be valid" do
    assert @post.valid?
  end

  test "should belong to user" do
    assert_not_nil @post.user
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "   "
    assert_not @post.valid?
  end

  test "should not be valid without to user" do
    @post.user = nil
    assert_not @post.valid?
  end

end
