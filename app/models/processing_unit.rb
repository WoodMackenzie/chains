class ProcessingUnit < ActiveRecord::Base

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  geocoded_by :address
  after_validation :geocode
  has_many :names, as: :nameable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :projects, as: :projectable, dependent: :destroy
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

  def granularity
  end

  def city_variable
  end

  def state_variable
  end

  def country_variable
  end

  def self.search(search)
    if search
      id_array = Array.new
      unit_array = Array.new
      unit_type_array = Array.new
      search_condition = "%" + search + "%"

      # Identify all of the processing unit names that have the search term within them
      name_results_1 = Name.where('name LIKE ? and nameable_type = ?', search_condition, "ProcessingUnit")
      name_results_1.all.each do |name_result|
        id_array.push(name_result.nameable_id)
      end

      # Identify all of the organizations that have the search term within their names
      organization_search = Name.where('name LIKE ? and nameable_type = ?', search_condition, "Organization")
      organization_search.all.each do |organization_action|
        name_results_2 = RoleAssignment.where('holder_type = ? AND subject_type = ? AND holder_id = ?', "Organization", "ProcessingUnit", organization_action.nameable_id)
        name_results_2.all.each do |name_result|
          if id_array.include?(name_result.subject_id)
          else
            id_array.push(name_result.subject_id)
          end
        end
      end

      # Identify any throughputs that have the search term within their description
      Commodity.all.each do |this_commodity|
        if this_commodity.description.downcase.include?(search.downcase)
          Throughput.all.each do |this_throughput|
            if this_throughput.commodity_id == this_commodity.id
              if id_array.include?(this_throughput.processing_unit_id)
              else
                id_array.push(this_throughput.processing_unit_id)
              end
            else
            end
          end
        else
        end
      end

      # Identify any unit types that have the search term within their aggregated description
      all_unit_types = UnitType.all.unit_type_list
      all_unit_types.each do |this_unit_type|
        if this_unit_type.at(1).downcase.include?(search.downcase)
          this_unit_type_id = this_unit_type.at(0)
          processing_unit_results = ProcessingUnit.where('unit_type_id = ?', this_unit_type_id)
          processing_unit_results.all.each do |this_processing_unit|
            if id_array.include?(this_processing_unit.id)
            else
              id_array.push(this_processing_unit.id)
            end
          end
        else
        end
      end

      # Identify any processing units that have city / state / country names that contain the search term
      processing_unit_results = ProcessingUnit.where('city LIKE ? OR state LIKE ? OR country LIKE ?', search_condition, search_condition, search_condition)
      processing_unit_results.each do |this_processing_unit|
        if id_array.include?(this_processing_unit.id)
        else
          id_array.push(this_processing_unit.id)
        end
      end

      # Compile that list of processing unit IDs into a list of processing unit objects
      id_array.each do |id_array_action|
        name_results_final = Name.where('nameable_id = ? AND nameable_type = ?', id_array_action, "ProcessingUnit").last.nameable
        unit_array.push(name_results_final)
      end

      # Return those objects
      return unit_array
    else
      ProcessingUnit.all
    end
  end

  def full_location
    if self.state.nil? and self.city != nil
      self.city + ", " + self.country
    elsif self.city.nil? and self.state != nil
      self.state + ", " + self.country
    elsif self.city.nil? and self.state.nil?
      self.country
    else
      self.city + ", " + self.state + ", " + self.country
    end
  end

end
