class Item < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :count
  end
end
