class RoleAssignment < ActiveRecord::Base
  belongs_to :holder_assignable, polymorphic: true
  belongs_to :subject_assignable, polymorphic: true
end
