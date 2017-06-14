class StaffingServices::PreVarifiedResourcesController < ApplicationController
  before_action :set_staffing_services_pre_varified_resource, only: [:show, :edit, :update, :destroy]

  # GET /staffing_services/pre_varified_resources
  # GET /staffing_services/pre_varified_resources.json
  def index
    @staffing_services_pre_varified_resources = StaffingServices::PreVarifiedResource.all
  end

  # GET /staffing_services/pre_varified_resources/1
  # GET /staffing_services/pre_varified_resources/1.json
  def show
  end

  # GET /staffing_services/pre_varified_resources/new
  def new
    @staffing_services_pre_varified_resource = StaffingServices::PreVarifiedResource.new
  end

  # GET /staffing_services/pre_varified_resources/1/edit
  def edit
  end

  # POST /staffing_services/pre_varified_resources
  # POST /staffing_services/pre_varified_resources.json
  def create
    @staffing_services_pre_varified_resource = StaffingServices::PreVarifiedResource.new(staffing_services_pre_varified_resource_params)

    respond_to do |format|
      if @staffing_services_pre_varified_resource.save
        format.html { redirect_to @staffing_services_pre_varified_resource, notice: 'Pre varified resource was successfully created.' }
        format.json { render :show, status: :created, location: @staffing_services_pre_varified_resource }
      else
        format.html { render :new }
        format.json { render json: @staffing_services_pre_varified_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffing_services/pre_varified_resources/1
  # PATCH/PUT /staffing_services/pre_varified_resources/1.json
  def update
    respond_to do |format|
      if @staffing_services_pre_varified_resource.update(staffing_services_pre_varified_resource_params)
        format.html { redirect_to @staffing_services_pre_varified_resource, notice: 'Pre varified resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @staffing_services_pre_varified_resource }
      else
        format.html { render :edit }
        format.json { render json: @staffing_services_pre_varified_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffing_services/pre_varified_resources/1
  # DELETE /staffing_services/pre_varified_resources/1.json
  def destroy
    @staffing_services_pre_varified_resource.destroy
    respond_to do |format|
      format.html { redirect_to staffing_services_pre_varified_resources_url, notice: 'Pre varified resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staffing_services_pre_varified_resource
      @staffing_services_pre_varified_resource = StaffingServices::PreVarifiedResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staffing_services_pre_varified_resource_params
      params.fetch(:staffing_services_pre_varified_resource, {})
    end
end
