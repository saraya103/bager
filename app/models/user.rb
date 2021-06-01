class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Input half-width alphanumeric characters.'

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :nickname
  end

  has_many :note_users, dependent: :destroy
  has_many :notes, through: :note_users
  has_many :items
  has_many :messages

  def self.count_reset
    all.each do |user|
      if user.count > 0 
        user.update_attribute(:count, 0)
      end
    end
  end

  def self.stop_down
    all.each do |user|
      if user.stop > 0 
        user.update_attribute(:stop, user.stop - 1)
      end
    end
  end
end
