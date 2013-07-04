module V1
  class SpecialInstructionsController < ApplicationController
    # GET /specialInstructions
    #def index
    #  @specialInstructions = SpecialInstruction.all
      
      #debugger
     # respond_to do |format|
     #   format.json { render :json => @specialInstructions }
     # end
    #end
    def show
      if params[:parent_id] and params[:sitter_id]
        @specialInstruction = SpecialInstruction.findByParentIdAndSitterId(params[:parent_id], params[:sitter_id])
      else
        @specialInstruction = SpecialInstruction.find(params[:id])
      end
  
      respond_to do |format|
        format.json { render :json => @specialInstruction }
      end
    end
    
    def create
      @specialInstruction_params = params[:special_instruction]
      @specialInstruction = SpecialInstruction.new(@specialInstruction_params)
      respond_to do |format|
        if @specialInstruction.save
          format.json { render :json => @specialInstruction, :status => :created}
        else
          format.json { render :json => {:errors => @specialInstruction.errors}, :status => :unprocessable_entity }
        end
      end
    end
    
    def update
      @specialInstruction = SpecialInstruction.find(params[:id])
  
      respond_to do |format|
        if @specialInstruction.update_attributes(params[:special_instruction])
          format.json { render :json => @specialInstruction, :status => :ok }
        else
          format.json { render :json => @specialInstruction.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    #def destroy
    #end
  end
end
