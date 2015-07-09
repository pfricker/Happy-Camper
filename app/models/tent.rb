class Tent < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: {
    large: "400x400>",
    medium: "300x300>",
    thumb: "75x75>"
    }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :user, presence: true
  validates :name, presence: true
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }
end
