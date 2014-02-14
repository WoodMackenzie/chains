class Name < ActiveRecord::Base
  belongs_to :nameable, polymorphic: true
end
