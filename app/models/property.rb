class Property < ActiveRecord::Base
  validates :total_bedrooms, presence: true
  validates :total_bedrooms, numericality: true
  validates :total_bathrooms, presence: true
  validates :total_bathrooms, numericality: true
  validates :address, presence: true
  validates :address, length: { minimum: 5 }
  validates :description, presence: true
  validates :address, length: { minimum: 10 }
  validates :commute_to_campus_in_minutes, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: true
  validates :city, presence: true
  validates :city, length: { minimum: 5 }
  validates :state, presence: true
  validates :state, length: { minimum: 1 }


  has_one :listing
  has_many :rooms
  has_many :images, :as => :attachable
  belongs_to :user
  accepts_nested_attributes_for :images
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode 

  has_paper_trail
end



  