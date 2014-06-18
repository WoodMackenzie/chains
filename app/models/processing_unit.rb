class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  has_many :names, as: :nameable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :role_holder_assignments, as: :holder, class_name: "RoleAssignment", dependent: :destroy
  has_many :role_subject_assignments, as: :subject, class_name: "RoleAssignment", dependent: :destroy
  has_many :throughputs, dependent: :destroy

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

  def self.processing_unit_list(view_date)
    array = Array.new
    ProcessingUnit.all.each do |processing_unit|
      array.push(processing_unit.latest_historical_name(view_date))
    end
    return array
  end

  def initial_name
  end

  def organization_id
  end

  def unit_type_description
  end

  def self.search(search)
    if search
      array = Array.new
      search_condition = "%" + search + "%"
      name_results = Name.where('name LIKE ? and nameable_type = ?', search_condition, "ProcessingUnit")
      name_results.all.each do |name_result|
        array.push(name_result.nameable)
      end        
      # name_results.all.each do |name_result|
      #   # if name_result.nameable_type = "ProcessingUnit"
      #   #   array.push(name_result.nameable)
      #   # elsif name_result.nameable_type = "Organization"
      #   #   array.push(name_result.nameable.role_holder_assignments.where('subject_type = ?', "ProcessingUnit").subjects)
      #   # end
      # end
      return array
    else
      ProcessingUnit.all
    end
  end

  def full_location
    if self.city.nil?
      self.state + ", " + self.country
    else
      self.city + ", " + self.state + ", " + self.country
    end
  end

end
