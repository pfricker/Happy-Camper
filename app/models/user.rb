class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :backpacks
  has_many :tents
  has_many :sleepingbags

  geocoded_by :location
  after_validation :geocode

  has_attached_file :avatar, styles: {
    large: "400x400>",
    medium: "300x300>",
    thumb: "75x75>"
    }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
end
