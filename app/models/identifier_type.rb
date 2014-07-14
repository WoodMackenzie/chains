class IdentifierType < ActiveRecord::Base

  has_many :identifier

  def self.identifier_type_list
    array = Array.new
    IdentifierType.all.each do |this_identifier_type|
      array.push(this_identifier_type.value)
    end
    return array
  end

end
