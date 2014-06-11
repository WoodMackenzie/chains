class UnitType < ActiveRecord::Base

  def self.root_unit_type_ids
    array = Array.new
    UnitType.all.each do |unit_type|
      if unit_type.parent_id.nil?
        array.push(unit_type.id)
      end
    end
    return array
  end

  def alpha_unit_types
    self.order(description: :asc)
  end

end