class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  has_many :names, as: :nameable
  has_many :comments, as: :commentable
  has_many :role_assignments, as: :holder_assignable
  has_many :role_assignments, as: :subject_assignable

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

  def organization_id
  end

  # def self.search(search)
  #   if search
  #     search_condition = "%" + search + "%"
  #     find(:all, :conditions => ['names LIKE ?', search_condition])
  #   else
  #     find(:all)
  #   end
  # end

  # def self.search(search)
  #   if search
  #     array = Array.new
  #     search_condition = "%" + search + "%"
  #     ProcessingUnit.all.each do |processing_unit|
  #       if processing_unit.names.find(:all, :conditions => ['names LIKE ?', search_condition])
  #         array.push(processing_unit)
  #       end
  #     end
  #     return array
  #   else
  #     find(:all)
  #   end
  # end

end
