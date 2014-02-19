class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  has_many :names, as: :nameable
  has_many :comments, as: :commentable

  def name_history
    self.names.order(active_date: :desc).order(updated_at: :desc)
  end

  def last_updated_name_history
    self.name_history.group(:active_date)
  end

  def historical_names(view_date)
    self.last_updated_name_history.where("active_date<=?",view_date)
  end

  def latest_historical_name(view_date)
    if self.historical_names(view_date).first
      self.historical_names(view_date).first.name
    end
  end

  def initial_name
  end

end
