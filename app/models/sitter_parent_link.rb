class SitterParentLink < ActiveRecord::Base
  attr_accessible :parent_id, :sitter_id
  
  def findSittersLinkedToParent(parentId)
    sitters = self.where("parent_id =?", parentId)
    return sitters
  end
  
  def findParentsLinkedToSitter(sitterId)
    parents = self.where("parent_id =?", sitterId)
    return parents
  end
end
