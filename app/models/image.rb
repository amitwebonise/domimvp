class Image < ActiveRecord::Base
  belongs_to :property
  belongs_to :room
  mount_uploader :photo, PhotoUploader
end
