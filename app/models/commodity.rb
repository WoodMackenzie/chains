class Commodity < ActiveRecord::Base

  def self.commodity_list
    array = Array.new
    Commodity.all.each do |commodity|
      array.push(commodity.description)
    end
    return array
  end

end
