class UnitType < ActiveRecord::Base
  has_ancestry

  def self.unit_type_names
    array = Array.new
    UnitType.all.each do |unit_type|
      array.push(unit_type.description)
    end
    return array
  end

end
