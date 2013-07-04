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
