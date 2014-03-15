class Profile < ActiveRecord::Base
  belongs_to :user

  scope :roommates, -> { where(roommates: true)}
  scope :looking_for_place, -> { where(looking_for_place: true)}
  mount_uploader :avatar, AvatarUploader
end
