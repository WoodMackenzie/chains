class Organization < ActiveRecord::Base
  has_many :names, as: :nameable
  has_many :comments, as: :commentable
  has_many :role_assignments, as: :holder_assignable
  has_many :role_assignments, as: :subject_assignable
end