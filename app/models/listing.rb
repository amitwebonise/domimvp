class Listing < ActiveRecord::Base
  validates :schedule, presence: true
  validates :open_to_student_only, presence: true
  validates :rent_per_month, presence: true
  validates :rent_per_month, numericality: true
  validates :is_available, presence: true

  belongs_to :user
  belongs_to :property
  has_many :appointments
  has_paper_trail
end
