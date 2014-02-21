class RoleAssignment < ActiveRecord::Base
  belongs_to :holder, polymorphic: true
  belongs_to :subject, polymorphic: true
end
