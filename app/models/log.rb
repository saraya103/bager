class Log < ApplicationRecord
  belongs_to :note
  belongs_to :item

  with_options presence: true do
    validates :name
    validates :price
    validates :count
    validates :buyer
  end
end
