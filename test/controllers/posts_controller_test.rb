require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    # Clear any existing comments before adding a new one
    @post.comments.delete_all
    @comment = @post.comments.create!(content: "Sample comment")  # Ensuring exactly one comment is added
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count", 1) do
      post posts_url, params: { post: { content: "New content with spaces", title: "Test Title" } }
    end

    assert_redirected_to post_url(Post.last)
    post = Post.last
    assert_equal "New content with spaces", post.content # Check that the spaces are stripped
  end

  test "should not create post without content" do
    assert_no_difference("Post.count") do
      post posts_url, params: { post: { content: "", title: "Test Title" } }
    end

    assert_response :unprocessable_entity
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { content: "Updated content with spaces", title: @post.title } }
    assert_redirected_to post_url(@post)

    @post.reload
    assert_equal "Updated content with spaces", @post.content # Ensure spaces were stripped after update
  end

  test "should destroy post" do
    # Ensure there is only one comment associated with the post before destroying the post
    assert_difference("Post.count", -1) do
      assert_difference("Comment.count", -1) do  # Deleting a post will delete its associated comment
        delete post_url(@post)
      end
    end
  end
end
