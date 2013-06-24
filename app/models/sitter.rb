class Sitter < ActiveRecord::Base
  attr_accessible :age, :availability_ind, :city, :contact_preference, :deleted_at, :email, :first_name, :hourly_rate, :last_name, :mobile_phone, :parent_address, :parent_name, :parent_phone, :rating, :skills, :state, :zip_code
end
