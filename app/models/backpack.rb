class Backpack < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: {
    large: "400x400>",
    medium: "300x300>",
    thumb: "75x75>"
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :user, presence: true
  validates :name, presence: true
  validates :capacity, numericality: true, allow_nil: true
  validates :size, inclusion: { in: %w(XS S M L XL) }, allow_nil: true
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }

  SIZES = %w(XS S M L XL)
  CONDITION = ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"]
  GENDER = %w(Mens Womens Unisex)
end
