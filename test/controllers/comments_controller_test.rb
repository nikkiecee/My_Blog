require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)  # Correcting this to make @comment accessible for other tests
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count", 1) do
      post comments_url, params: {
        comment: {
          content: "This is a test comment",      # safer to hardcode test content
          post_id: posts(:one).id                 # assuming you have fixtures
        }
      }
      # puts assigns(:comment).errors.full_messages # great for debugging!
    end

    assert_redirected_to comment_url(Comment.last)
  end  # Fixed issue: closing `test "should create comment"` block here

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    comment = comments(:one)
    patch comment_url(comment), params: { comment: { content: "Updated content", post_id: comment.post_id } }
    assert_redirected_to comment_url(comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
