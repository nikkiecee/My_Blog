class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true

  before_save :strip_attributes

  private

  def strip_attributes
    self.title = title.to_s.strip.presence
    self.content = content.to_s.strip.presence
  end
end
