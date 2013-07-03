class Parent < ActiveRecord::Base
  attr_accessible :address, :city, :deleted_at, :email1, :email2, :family_name, :father_name, :home_phone, :mobile_phone1, :mobile_phone2, :mother_name, :state, :work_phone, :zip_code
  
  validates :address, :city, :email1, :family_name, :home_phone, :mobile_phone1, :state, :zip_code, :presence => {:message => 'Required'}
  
  
  def self.formatErrors(errors)
    if errors
      AppSettings.load!("#{Rails.root}/config/app_configs.yml")
      errorsHash = Hash.new
      errorHash = Hash.new
      errors.each do |key,errs|
        errs.each do |error|
          errorHash['status']=error
          errorHash['message']=AppSettings.errors[error]
        end
      end
      errorsHash['errors'] = errorHash
      return errorsHash
    end
  end
end
