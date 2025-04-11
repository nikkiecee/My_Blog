class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true
  before_save :strip_content

  private

  def strip_content
    self.content = content.strip if content.is_a?(String) && content.present?
  end
end
