class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_filter :service_provider_only, except: [:show, :update] #this method service_provider_only declared in app_contlr
  before_action :set_job_application, only: [:show, :update, :destroy]


  # GET /job_applications
  # GET /job_applications.json
  def index
    @job_applications = Job.all.paginate(:page => params[:page], :per_page => 1)
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit
    @job = Job.find(params[:id])
    @sp = ServiceProvider.where(domain_id: @job.domain_id, user_id: current_user.id).first

    @job_application = JobApplication.new
    @job_application.service_provider_id = @sp.id
    @job_application.job_id = @job.id
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job = Job.find(params[:job_application][:job_id])
    @sp = ServiceProvider.where(domain_id: @job.domain_id, user_id: current_user.id).first
    params[:job_application][:service_provider_id] = @sp.id
    params[:job_application][:status] = 0
    @job_application = JobApplication.new(job_application_params)

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      # binding.pry
      params[:job_application].permit!
    end

end
