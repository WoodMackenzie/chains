class UnitsOfMeasure < ActiveRecord::Base

  belongs_to :measure_type

  def measure_type_description
  end
  
end
