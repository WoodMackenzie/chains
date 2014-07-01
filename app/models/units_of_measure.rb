class UnitsOfMeasure < ActiveRecord::Base

  belongs_to :measure_type

  def measure_type_description
  end

  def self.amount_unit_list
    array = Array.new
    mass_measure_type_id = MeasureType.where("description LIKE ?","Mass").first.id
    mass_results = UnitsOfMeasure.where("measure_type_id=?",mass_measure_type_id)
    mass_results.all.each do |mass_result|
      array.push(mass_result.description)
    end
    volume_measure_type_id = MeasureType.where("description LIKE ?","Volume").first.id
    volume_results = UnitsOfMeasure.where("measure_type_id=?",volume_measure_type_id)
    volume_results.all.each do |volume_result|
      array.push(volume_result.description)
    end
    return array
  end

  def self.time_unit_list
    array = Array.new
    time_measure_type_id = MeasureType.where("description LIKE ?","Time").first.id
    time_results = UnitsOfMeasure.where("measure_type_id=?",time_measure_type_id)
    time_results.all.each do |time_result|
      array.push(time_result.description)
    end
    return array
  end
  
  def self.currency_unit_list
    array = Array.new
    time_measure_type_id = MeasureType.where("description LIKE ?","Currency").first.id
    time_results = UnitsOfMeasure.where("measure_type_id=?",time_measure_type_id)
    time_results.all.each do |time_result|
      array.push(time_result.description)
    end
    return array
  end

end
