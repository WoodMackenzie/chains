class MeasureType < ActiveRecord::Base

    def self.measure_type_names
    array = Array.new
    MeasureType.all.each do |measure_type|
      array.push(measure_type.description)
    end
    return array
  end

end
