class Organization < ActiveRecord::Base

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

  def self.organization_names
    array = Array.new
    Organization.all.each do |organization|
      array.push(organization.latest_historical_name(Time.now))
    end
    return array
  end

  # def information_source_names
  #   self.organization_names.order()
  # end

  def initial_name
  end

end