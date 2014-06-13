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

  def self.root_unit_type_descriptions
    array = Array.new
    UnitType.all.each do |unit_type|
      if unit_type.parent_id.nil?
        array.push(unit_type.description)
      end
    end
    return array
  end

  def children_list
    UnitType.where('parent_id = ?', self.id)
  end

  def has_no_children
    if self.children_list.empty?
      true
    else
      false
    end
  end

  def unit_type_string
    temp_string = ""
    current_unit_type = self
    until current_unit_type.parent_id.nil?
      if temp_string != ""
        temp_string = current_unit_type.description + " - " + temp_string 
      else
        temp_string = current_unit_type.description
      end
      current_unit_type = UnitType.find(current_unit_type.parent_id)
    end
    if temp_string != ""
      temp_string = current_unit_type.description + " - " + temp_string 
    else
      temp_string = current_unit_type.description
    end
  end

  def self.unit_type_list
    array = Array.new
    UnitType.all.each do |unit_type|
      if unit_type.has_no_children
        array.push(unit_type.unit_type_string)
      end
    end
    return array
  end

end