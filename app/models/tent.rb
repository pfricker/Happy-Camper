class Tent < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :condition, inclusion: { in: ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"] }
end
