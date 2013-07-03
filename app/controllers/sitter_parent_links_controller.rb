class SitterParentLinksController < ApplicationController
    
  def create
    @sitterParentLink_params = params[:special_instruction]
    @sitterParentLink = SitterParentLink.new(@specialInstruction_params)
    respond_to do |format|
      if @sitterParentLink.save
        format.json { render :json => @sitterParentLink, :status => :created}
      else
        format.json { render :json => {:errors => @sitterParentLink.errors}, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sitterParentLink = SitterParentLink.find(params[:id])
    @sitterParentLink.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
