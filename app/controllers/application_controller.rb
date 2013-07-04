class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #AppSettings.load!("#{Rails.root}/config/app_configs.yml")
  
  def fetchNonDeleted(obj)
    content = Array.new
    obj.each do |ct|
      if ct.deleted_at == nil
        content.push(ct)
      end
    end
    return content
  end
  
  def visualDestroy(obj)
    obj.update_attributes(:deleted_at => Date.today)
  end
  
  def convertParentResponse(parentObj)
    if (parentObj.respond_to?(:map)) then
      return parentObj.map do |parent| 
            {
            :ParentId => parent.id, 
            :familyName => parent.family_name, 
            :fatherName => parent.father_name, 
            :motherName => parent.mother_name, 
            :address => parent.address, 
            :city => parent.city, 
            :state => parent.state, 
            :zipCode => parent.zip_code, 
            :email => parent.email1, 
            :alternateEmail => parent.email2, 
            :homePhone => parent.home_phone, 
            :mobilePhone => parent.mobile_phone1, 
            :alternateMobilePhone => parent.mobile_phone2, 
            :workPhone => parent.work_phone
          } 
        end
    else
      return {
        :ParentId => parentObj.id, 
        :familyName => parentObj.family_name, 
        :fatherName => parentObj.father_name, 
        :motherName => parentObj.mother_name, 
        :address => parentObj.address, 
        :city => parentObj.city, 
        :state => parentObj.state, 
        :zipCode => parentObj.zip_code, 
        :email => parentObj.email1, 
        :alternateEmail => parentObj.email2, 
        :homePhone => parentObj.home_phone, 
        :mobilePhone => parentObj.mobile_phone1, 
        :alternateMobilePhone => parentObj.mobile_phone2, 
        :workPhone => parentObj.work_phone
      } 
    end
  end
  
  def checkParams(required_fields, obj)
    #debugger
    required_fields.each do |r|
      if obj == nil or obj ==""
        if params[r] == "" or params[r] == nil
          return false
        end
      else
        if obj[r] == "" or obj[r] == nil
        return false
        end
      end
    end
    return true
  end
  
  def formatErrors(errors)
    if errors
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
