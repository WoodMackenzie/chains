class Project < ActiveRecord::Base

  has_many :project_detail_numericals, dependent: :destroy
  has_many :project_detail_strings, dependent: :destroy
  belongs_to :projectable, polymorphic: :true
  
end
