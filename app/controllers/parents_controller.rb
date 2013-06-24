class ParentsController < ApplicationController
  # GET /parents
  def index
    @parents = Parent.all
    @parents = fetchNonDeleted(@parents)
    #debugger
    respond_to do |format|
      format.json { render :json => @parents }
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
        format.json { render :json => @parent, :status => :created}
      else
        format.json { render :json => Parent.formatErrors(@parent.errors), :status => :unprocessable_entity }
      end
    end
  end

  def update
    @parent = Parent.find(params[:id])

    respond_to do |format|
      if @parent.update_attributes(params[:parent])
        format.json { render :json => @parent, :status => :ok}
      else
        format.json { render :json => @parent.errors, :status => :unprocessable_entity }
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
  
end
