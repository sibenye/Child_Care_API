class SpecialInstruction < ActiveRecord::Base
  attr_accessible :instruction, :job_id, :parent_id, :sitter_id
  
  def findByParentIdAndSitterId(parentId, sitterId)
    instructions = self.where("parent_id=? AND sitter_id=?", parentId, sitterId)
    return instructions
  end
end
