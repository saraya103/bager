class Note < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :users, through: :note_users
  has_many :note_users

  validates :genre_id, numericality: { other_than: 0 } 
end
