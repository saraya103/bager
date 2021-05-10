class Note < ApplicationRecord
  before_create :set_id
  default_scope { order(created_at: :desc) }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :note_users, foreign_key: 'note_id'
  has_many :users, through: :note_users


  validates :genre_id, numericality: { other_than: 0 } 

  private
    def set_id
      while self.id.blank? || Note.find_by(id: self.id).present? do
        self.id = SecureRandom.alphanumeric(12)
      end
      self.password = SecureRandom.alphanumeric(6)
    end
end
