class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  
  def organization_id
  end
  
end
