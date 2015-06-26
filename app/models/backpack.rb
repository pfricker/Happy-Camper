class Backpack < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :capacity, numericality: true
  validates :size, inclusion: { in: %w(XS S M L XL) }, allow_nil: true
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }
end
