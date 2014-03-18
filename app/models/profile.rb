class Profile < ActiveRecord::Base
  belongs_to :user

  scope :open_to_roommates, -> { where(open_to_roommates: true)}
  scope :looking_for_place, -> { where(looking_for_place: true)}
  mount_uploader :avatar, AvatarUploader
end
