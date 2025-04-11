require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @post = Post.create!(title: "Test Post", content: "This is the post content")
    @comment = Comment.new(content: "This is a comment", post: @post)
  end

  test "should be valid with valid attributes" do
    assert @comment.valid?
  end

  test "should not be valid without content" do
    @comment.content = nil
    assert_not @comment.valid?
    assert_includes @comment.errors[:content], "can't be blank"
  end

  test "should belong to a post" do
    assert_equal @post, @comment.post
  end

  test "should strip content before saving" do
    @comment.content = "   Trimmed content   "
    @comment.save
    assert_equal "Trimmed content", @comment.reload.content
  end
end
