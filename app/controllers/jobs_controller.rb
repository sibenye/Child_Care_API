class JobsController < ApplicationController
  # GET /jobs
  #def index
   # @jobs = Job.all
   # @jobs = fetchNonDeleted(@jobs)
    #debugger
   # respond_to do |format|
   #   format.json { render :json => @jobs }
   # end
  #end

  def show
    if params[:parent_id]
      @job = Job.findByParentId(params[:parent_id])
      @job = fetchNonDeleted(@job)
    else
      @job = Job.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @job }
    end
  end

  def create
    @job_params = params[:sitter]
    @job = Job.new(@job_params)
    respond_to do |format|
      if @job.save
        format.json { render :json => @job, :status => :created}
      else
        format.json { render :json => {:errors => @job.errors}, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:sitter])
        format.json { render :json => @job, :status => :ok }
      else
        format.json { render :json => {:errors => @job.errors}, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    visualDestroy(@job)
    
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
end
