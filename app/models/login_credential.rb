class LoginCredential < ActiveRecord::Base
  attr_accessible :password, :user_id
end
