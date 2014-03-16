class Appointment < ActiveRecord::Base
  validates :time, presence: true

  belongs_to :tenant
  belongs_to :subletter
  belongs_to :listing
  acts_as_commentable
end
