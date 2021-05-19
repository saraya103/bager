class Reserve < ApplicationRecord
  belongs_to :note
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :next

  with_options presence: true do
    validates :date
    validates :next_id
    validates :once
  end
end
