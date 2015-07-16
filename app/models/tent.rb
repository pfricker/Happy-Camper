class Tent < ActiveRecord::Base
  belongs_to :user
  include PgSearch
  pg_search_scope :search,
    against: [:name, :brand],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location,
    :latitude => "users.latitude",
    :longitude => "users.longitude"

  has_attached_file :image, styles: {
    large: "400x400>",
    medium: "300x300>",
    thumb: "75x75>"
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :user, presence: true
  validates :name, presence: true
  validates :use, inclusion: { in: ["Ultra Light", "Backpacking", "Mountaineering", "Car/Base Camping"] }
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }

  CONDITION = ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"]
  USE = ["Ultra Light", "Backpacking", "Mountaineering", "Car/Base Camping"]

  def self.location_search (location)
    joins(:user).near(location, 300)
  end
end
