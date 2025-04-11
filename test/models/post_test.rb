require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Test Title", content: "This is the content")
  end

  test "should be valid with valid attributes" do
    assert @post.valid?
  end

  test "should not be valid without content" do
    @post.content = nil
    assert_not @post.valid?
    assert_includes @post.errors[:content], "can't be blank"
  end

  test "should strip content before saving" do
    @post.content = "   Hello with spaces   "
    @post.save
    assert_equal "Hello with spaces", @post.reload.content
  end
end
