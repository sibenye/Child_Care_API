class Job < ActiveRecord::Base
  attr_accessible :amount_estimate, :amount_paid, :confirm_date, :deleted_at, :end_date, :name, :parent_id, :pay_date, :sitter1_id, :sitter2_id, :sitter3_id, :start_date, :status
  
  validates :name, :parent_id, :start_date, :end_date, :presence => {:message => 'Required parameter not provided'}
  
  def findByParentId(parentId)
    jobs = self.where("parent_id =?", parentId)
    return jobs
  end
end
