class Property < ActiveRecord::Base
  has_one :listing
  has_many :rooms
  has_many :images
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
