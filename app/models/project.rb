class Project < ActiveRecord::Base

  belongs_to :projectable, polymorphic: true
  has_many :project_detail_numericals, dependent: :destroy
  has_many :project_detail_strings, dependent: :destroy

  def investment_probability_variable
  end

  def project_status_variable
  end

  def project_type_variable
  end

end
