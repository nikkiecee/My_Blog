class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true

  before_save :strip_attributes

  private

  def strip_attributes
    self.title = title.strip.presence if title.is_a?(String) && title.present?
self.content = content.strip.presence if content.is_a?(String) && content.present?
  end
end
