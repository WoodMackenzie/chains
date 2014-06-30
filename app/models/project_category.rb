class ProjectCategory < ActiveRecord::Base

  def self.root_category_ids
    array = Array.new
    ProjectCategory.all.each do |category|
      if category.parent_id.nil?
        array.push(category.id)
      end
    end
    return array
  end

  def self.root_categories
    array = Array.new
    ProjectCategory.all.each do |category|
      if category.parent_id.nil?
        array.push(category)
      end
    end
    return array
  end

  def self.root_category_descriptions
    array = Array.new
    ProjectCategory.all.each do |category|
      if category.parent_id.nil?
        array.push(category.description)
      end
    end
    return array
  end

  def children_list
    ProjectCategory.where('parent_id = ?', self.id)
  end

  def children_list_string
    hash = Hash.new
    self.children_list.all.each do |category|
      hash[category.id] = category.description
    end
    return hash
  end

  def has_no_children
    if self.children_list.empty?
      true
    else
      false
    end
  end

  def category_string
    hash = Hash.new
    temp_string = ""
    current_category = self
    until current_category.parent_id.nil?
      if temp_string != ""
        temp_string = current_category.description + " - " + temp_string 
      else
        temp_string = current_category.description
      end
      current_category = ProjectCategory.find(current_category.parent_id)
    end
    if temp_string != ""
      temp_string = current_category.description + " - " + temp_string 
    else
      temp_string = current_category.description
    end
    hash[self.id] = temp_string
    hash
  end

  def self.category_list
    hash = Hash.new
    ProjectCategory.all.each do |category|
      if category.has_no_children
        hash[category.category_string.keys.first] = category.category_string[category.unit_type_string.keys.first]
      end
    end
    return hash
  end

end
