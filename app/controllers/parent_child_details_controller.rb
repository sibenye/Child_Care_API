class ParentChildDetailsController < ApplicationController
  
  def show
    if params[:parent_id]
      @parentChildDetail = ParentChildDetail.findByParentId(params[:parent_id])
    else
      @parentChildDetail = ParentChildDetail.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @parentChildDetail }
    end
  end
    
  def create
    @parentChildDetail_params = params[:parent_child_detail]
    @parentChildDetail = ParentChildDetail.new(@parentChildDetail_params)
    respond_to do |format|
      if @parentChildDetail.save
        format.json { render :json => @parentChildDetail, :status => :created}
      else
        format.json { render :json => @parentChildDetail.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @parentChildDetail = ParentChildDetail.find(params[:id])

    respond_to do |format|
      if @parentChildDetail.update_attributes(params[:parent_child_detail])
        format.json { render :json => @parentChildDetail, :status => :created }
      else
        format.json { render :json => @parentChildDetail.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #def destroy
  #end
end
