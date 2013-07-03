class ParentChildDetail < ActiveRecord::Base
  attr_accessible :activities, :allergies, :birthday, :blood_type, :dentist_name, :dentist_phone, :eye_color, :grade, :hair_color, :height, :medication, :name, :other_info, :parent_id, :pediatrician_name, :pediatrician_phone, :school, :weight
  
  validates :name, :parent_id, :birthday, :presence => {:message => 'Required parameter not provided'}
  
  def findByParentId(parentId)
    child = self.where("parent_id =?", parentId)
    return child
  end
end
