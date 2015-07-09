class Backpack < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: {
    large: "400x400>",
    medium: "300x300>",
    thumb: "75x75>"
    }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :user, presence: true
  validates :name, presence: true
  validates :capacity, numericality: true, allow_nil: true
  validates :size, inclusion: { in: %w(XS S M L XL) }, allow_nil: true
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }
end
