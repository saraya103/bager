class Log < ApplicationRecord
  belongs_to :note
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :price
    validates :count
    validates :buyer
  end
end
