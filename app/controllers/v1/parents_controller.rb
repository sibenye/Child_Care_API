module V1
  class ParentsController < ApplicationController
    # GET /parents
    def index
      @parents = Parent.all
      @parents = fetchNonDeleted(@parents)
      #debugger
      respond_to do |format|
        format.json { render :json => convertParentResponse(@parents) }
      end
    end
  
    def show
      if params[:sitterId]
        @parent = SitterParentLink.findParentsLinkedToSitter(params[:sitterId])
      else
        @parent = Parent.find(params[:parentId])
      end
  
      respond_to do |format|
        format.json { render :json => @parent }
      end
    end
  
    # GET /parents/new
    # GET /parents/new.json
    #def new
    #  @parent = Parent.new
  
    #  respond_to do |format|
    #    format.html # new.html.erb
     #   format.json { render :json => @parent }
     # end
    #end
  
    # GET /parents/1/edit
   # def edit
   #   @parent = Parent.find(params[:id])
   # end
    
    def create
      @parent_params = convertParentRequest(params[:parent])
      @parent = Parent.new(@parent_params)
      respond_to do |format|
        if @parent.save
          format.json { render :json => convertParentResponse(@parent), :status => :created}
        else
          format.json { render :json => {:errors => @parent.errors}, :status => :unprocessable_entity }
        end
      end
    end
  
    def update
      @parent = Parent.find(params[:parentId])
  
      respond_to do |format|
        if @parent.update_attributes(convertParentRequest(params[:parent]))
          format.json { render :json => convertParentResponse(@parent), :status => :ok}
        else
          format.json { render :json => {:errors => @parent.errors}, :status => :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @parent = Parent.find(params[:parentId])
      visualDestroy(@parent)
  
      respond_to do |format|
        format.html { redirect_to parents_url }
        format.json { head :no_content }
      end
    end
    
    def convertParentRequest(parentObj)
      if (parentObj == nil or parentObj == {})
        return parentObj
      end
      parent = Hash.new("")
      if parentObj[:parentId] != nil then
        parent[:id] = parentObj[:parentId]
      end
      if parentObj[:familyName] != nil then
        parent[:family_name] = parentObj[:familyName]
      end
      if parentObj[:fatherName] != nil then
        parent[:father_name] = parentObj[:fatherName]
      end
      if parentObj[:motherName] != nil then
        parent[:mother_name] = parentObj[:motherName]
      end
      if parentObj[:address] != nil then
        parent[:address] = parentObj[:address]
      end
      if parentObj[:city] != nil then
        parent[:city] = parentObj[:city]
      end
      if parentObj[:state] != nil then
        parent[:state] = parentObj[:state]
      end
      if parentObj[:zipCode] != nil then
        parent[:zip_code] = parentObj[:zipCode]
      end
      if parentObj[:email] != nil then
        parent[:email1] = parentObj[:email]
      end
      if parentObj[:alternateEmail] != nil then
        parent[:email2] = parentObj[:alternateEmail]
      end
      if parentObj[:homePhone] != nil then
        parent[:home_phone] = parentObj[:homePhone]
      end
      if parentObj[:mobilePhone] != nil then
        parent[:mobile_phone1] = parentObj[:mobilePhone]
      end
      if parentObj[:alternateMobilePhone] != nil then
        parent[:mobile_phone2] = parentObj[:alternateMobilePhone]
      end
      if parentObj[:workPhone] != nil then
        parent[:work_phone] = parentObj[:workPhone]
      end
      
      return parent
    end
    
    def convertParentResponse(parentObj)
      if (parentObj.respond_to?(:map)) then
        return parentObj.map do |parent| 
              {
              :parentId => parent.id, 
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
      elsif (parentObj != nil and parentObj != {})
        return {
          :parentId => parentObj.id, 
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
      else
        return parentObj
      end
    end
    
  end
end