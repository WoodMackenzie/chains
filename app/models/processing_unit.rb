class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  has_many :names, as: :nameable
  has_many :comments, as: :commentable
  
end
