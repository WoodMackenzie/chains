class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  has_many :names, as: :nameable
  has_many :comments, as: :commentable

  def name_at_date(which_date)
    ordered_names = ProcessingUnit.names.order(active_date: :desc)
    active_names = ordered_names.where(names.active_date < which_date)
    
  end
end
