class Property < ActiveRecord::Base
  has_one :listing
  has_many :rooms
  has_many :images, :as => :attachable
  belongs_to :user
  accepts_nested_attributes_for :images
end




  

  