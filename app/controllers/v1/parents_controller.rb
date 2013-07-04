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
      if params[:sitter_id]
        @parent = SitterParentLink.findParentsLinkedToSitter(params[:sitter_id])
      else
        @parent = Parent.find(params[:id])
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
      @parent_params = params[:parent]
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
      @parent = Parent.find(params[:id])
  
      respond_to do |format|
        if @parent.update_attributes(params[:parent])
          format.json { render :json => convertParentResponse(@parent), :status => :ok}
        else
          format.json { render :json => {:errors => @parent.errors}, :status => :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @parent = Parent.find(params[:id])
      visualDestroy(@parent)
  
      respond_to do |format|
        format.html { redirect_to parents_url }
        format.json { head :no_content }
      end
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
    
  end
end