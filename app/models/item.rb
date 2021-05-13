class Item < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    with_options numericality: true do
      validates :price
      validates :count
    end
  end
end
