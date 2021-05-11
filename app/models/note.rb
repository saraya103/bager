class Note < ApplicationRecord
  require 'securerandom'
  before_create :set_id

  has_many :note_users
  has_many :users, through: :note_users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre


  with_options presence: true do
    validates :path#, uniqueness: { case_sensitive: false }
    validates :password
    validates :owner
    validates :list_name
    validates :log_name
    validates :reserve_name
    validates :item_name
  end
  validates :genre_id, numericality: { other_than: 0 } 

  private
    def set_id
#      while self.path.blank? || Note.find_by(path: self.path).present? do
        self.path = SecureRandom.alphanumeric(12)
#      end
      self.password = SecureRandom.alphanumeric(6)
    end
end
