module V1
  class SittersController < ApplicationController
    # GET /sitters
    def index
      @sitters = Sitter.all
      @sitters = fetchNonDeleted(@sitters)
      #debugger
      respond_to do |format|
        format.json { render :json => @sitters }
      end
    end
  
    def show
      if params[:parentId]
        @sitter = SitterParentLink.findSittersLinkedToParent(params[:parentId])
      else
        @sitter = Sitter.find(params[:sitterId])
      end
  
      respond_to do |format|
        format.json { render :json => @sitter }
      end
    end
  
    def create
      @sitter_params = convertSitterRequest(params[:sitter])
      @sitter = Sitter.new(@sitter_params)
      respond_to do |format|
        if @sitter.save
          format.json { render :json => @sitter, :status => :created}
        else
          format.json { render :json => {:errors => @sitter.errors}, :status => :unprocessable_entity }
        end
      end
    end
    
    def update
      @sitter = Sitter.find(params[:sitterId])
  
      respond_to do |format|
        if @sitter.update_attributes(convertSitterRequest(params[:sitter]))
          format.json { render :json => @sitter, :status => :ok }
        else
          format.json { render :json => {:errors => @sitter.errors}, :status => :unprocessable_entity }
        end
      end
    end
    
    def destroy
      @sitter = Sitter.find(params[:sitterId])
      visualDestroy(@sitter)
  
      respond_to do |format|
        format.json { head :no_content }
      end
    end
    
    def convertSitterRequest(sitterObj)
      if (sitterObj == nil or sitterObj == {})
        return sitterObj
      end
      sitter = Hash.new("")
      if sitterObj[:sitterId] != nil then
        sitter[:id] = sitterObj[:sitterId]
      end
      if sitterObj[:firstName] != nil then
        sitter[:first_name] = sitterObj[:firstName]
      end
      if sitterObj[:lastName] != nil then
        sitter[:last_name] = sitterObj[:lastName]
      end
      if sitterObj[:age] != nil then
        sitter[:age] = sitterObj[:age]
      end
      if sitterObj[:address] != nil then
        sitter[:address] = sitterObj[:address]
      end
      if sitterObj[:city] != nil then
        sitter[:city] = sitterObj[:city]
      end
      if sitterObj[:state] != nil then
        sitter[:state] = sitterObj[:state]
      end
      if sitterObj[:zipCode] != nil then
        sitter[:zip_code] = sitterObj[:zipCode]
      end
      if sitterObj[:email] != nil then
        sitter[:email] = sitterObj[:email]
      end
      if sitterObj[:sitterParentName] != nil then
        sitter[:parent_name] = sitterObj[:sitterParentName]
      end
      if sitterObj[:sitterParentPhone] != nil then
        sitter[:parent_phone] = sitterObj[:sitterParentPhone]
      end
      if sitterObj[:contactPreference] != nil then
        sitter[:contact_preference] = sitterObj[:contactPreference]
      end
      if sitterObj[:hourlyRate] != nil then
        sitter[:hourly_rate] = sitterObj[:hourlyRate]
      end
      if sitterObj[:rating] != nil then
        sitter[:rating] = sitterObj[:rating]
      end
      if sitterObj[:skills] != nil then
        sitter[:skills] = sitterObj[:skills]
      end
      if sitterObj[:availabilityInd] != nil then
        sitter[:availability_ind] = sitterObj[:availabilityInd]
      end
      
      return sitter
    end
    
    def convertSitterResponse(sitterObj)
      if (sitterObj.respond_to?(:map)) then
        return sitterObj.map do |sitter| 
              {
              :sitterId => sitter.id, 
              :firstName => sitter.first_name, 
              :lastName => sitter.last_name, 
              :age => sitter.age, 
              :address => sitter.address, 
              :city => sitter.city, 
              :state => sitter.state, 
              :zipCode => sitter.zip_code, 
              :email => sitter.email, 
              :sitterParentName => sitter.parent_name, 
              :sitterParentPhone => sitter.parent_phone, 
              :contactPreference => sitter.contact_preference, 
              :hourlyRate => sitter.hourly_rate, 
              :rating => sitter.rating,
              :skills => sitter.skills,
              :availabilityInd => sitter.availibility_ind
            } 
          end
      elsif (sitterObj != nil and sitterObj != {})
        return {
              :sitterId => sitterObj.id, 
              :firstName => sitterObj.first_name, 
              :lastName => sitterObj.last_name, 
              :age => sitterObj.age, 
              :address => sitterObj.address, 
              :city => sitterObj.city, 
              :state => sitterObj.state, 
              :zipCode => sitterObj.zip_code, 
              :email => sitterObj.email, 
              :sitterParentName => sitterObj.parent_name, 
              :sitterParentPhone => sitterObj.parent_phone, 
              :contactPreference => sitterObj.contact_preference, 
              :hourlyRate => sitterObj.hourly_rate, 
              :rating => sitterObj.rating,
              :skills => sitterObj.skills,
              :availabilityInd => sitterObj.availibility_ind
        } 
      else
        return sitterObj
      end
    end
    
  end
end