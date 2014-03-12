class Appointment < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :subletter
  belongs_to :listing
  acts_as_commentable
end
