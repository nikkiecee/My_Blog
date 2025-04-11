class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true
  before_save :strip_content

  private

  def strip_content
    self.content = content.strip if content.present?
  end
end
