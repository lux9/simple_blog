require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
  end

  test "should get new" do
    get post_url(@post)
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { title: 'title', body: 'body', user_id: users(:one).id } }
    end

    assert_redirected_to post_url(Post.last)
    follow_redirect!
    assert_response :success
  end

  test "should not create post if no title" do
    assert_difference('Post.count', 0) do
      post posts_url, params: { post: { title: '', body: 'body', user_id: users(:one).id } }
    end
  end

  test "should not create post if no body" do
    assert_difference('Post.count', 0) do
      post posts_url, params: { post: { title: 'title', body: '', user_id: users(:one).id } }
    end
  end
end
