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
    if params[:parent_id]
      @sitter = SitterParentLink.findSittersLinkedToParent(params[:parent_id])
    else
      @sitter = Sitter.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @sitter }
    end
  end

  def create
    @sitter_params = params[:sitter]
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
    @sitter = Sitter.find(params[:id])

    respond_to do |format|
      if @sitter.update_attributes(params[:sitter])
        format.json { render :json => @sitter, :status => :ok }
      else
        format.json { render :json => {:errors => @sitter.errors}, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sitter = Sitter.find(params[:id])
    visualDestroy(@sitter)

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
