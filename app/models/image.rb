class Image < ActiveRecord::Base
  belongs_to :property
  belongs_to :room
  belongs_to :attachable, :polymorphic => true
  mount_uploader :photo, PhotoUploader
end
