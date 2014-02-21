class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  def organization_id
  end
  
end
