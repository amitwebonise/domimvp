class Appointment < ActiveRecord::Base
  validates :time, presence: true
  validates :requester_id, presence: true

  belongs_to :requester, class_name: 'User'
  belongs_to :listing
  acts_as_commentable
  has_paper_trail
end
