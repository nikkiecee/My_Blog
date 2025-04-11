class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true
  before_save :strip_content

  private

  def strip_content
    self.content = content.to_s.strip.presence
  end
end
