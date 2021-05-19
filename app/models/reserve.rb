class Reserve < ApplicationRecord
  belongs_to :note
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :next
  belongs_to :once

  with_options presence: true do
    validates :date
    validates :next_id
    validates :once_id
  end
end
