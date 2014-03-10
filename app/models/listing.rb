class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :appointments
end
