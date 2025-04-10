# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with content and post" do
    post = Post.create(title: "Test Title", body: "Test body")
    comment = Comment.new(content: "Nice post!", post: post)
    expect(comment).to be_valid
  end

  it "is invalid without content" do
    comment = Comment.new(content: nil)
    expect(comment).not_to be_valid
  end
end
