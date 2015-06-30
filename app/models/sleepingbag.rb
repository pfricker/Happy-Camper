class Sleepingbag < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :temp_rating, numericality: true, allow_nil: true
  validates :size, inclusion: { in: %w(Womens Reg Long) }
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }
  validates :fill, inclusion: { in: %w(Down Synthetic)}
end
