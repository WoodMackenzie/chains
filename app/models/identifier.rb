class Identifier < ActiveRecord::Base

  belongs_to :identifier_type
  
  def identifier_type_description
  end

end
