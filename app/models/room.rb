class Room < ActiveRecord::Base
  belongs_to :property
  belongs_to :tenant
  belongs_to :subletter
  has_many :images
end
