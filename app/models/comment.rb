class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
