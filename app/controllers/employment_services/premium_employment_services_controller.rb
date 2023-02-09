class EmploymentServices::PremiumEmploymentServicesController < ApplicationController
  before_action :set_employment_services_premium_employment_service, only: [:show, :edit, :update, :destroy]

  # GET /employment_services/premium_employment_services
  # GET /employment_services/premium_employment_services.json
  def index
    @employment_services_premium_employment_services = EmploymentServices::PremiumEmploymentService.all
  end

  # GET /employment_services/premium_employment_services/1
  # GET /employment_services/premium_employment_services/1.json
  def show
  end

  # GET /employment_services/premium_employment_services/new
  def new
    @employment_services_premium_employment_service = EmploymentServices::PremiumEmploymentService.new
  end

  # GET /employment_services/premium_employment_services/1/edit
  def edit
  end

  # POST /employment_services/premium_employment_services
  # POST /employment_services/premium_employment_services.json
  def create
    @employment_services_premium_employment_service = EmploymentServices::PremiumEmploymentService.new(employment_services_premium_employment_service_params)

    respond_to do |format|
      if @employment_services_premium_employment_service.save
        format.html { redirect_to @employment_services_premium_employment_service, notice: 'Premium employment service was successfully created.' }
        format.json { render :show, status: :created, location: @employment_services_premium_employment_service }
      else
        format.html { render :new }
        format.json { render json: @employment_services_premium_employment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employment_services/premium_employment_services/1
  # PATCH/PUT /employment_services/premium_employment_services/1.json
  def update
    respond_to do |format|
      if @employment_services_premium_employment_service.update(employment_services_premium_employment_service_params)
        format.html { redirect_to @employment_services_premium_employment_service, notice: 'Premium employment service was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment_services_premium_employment_service }
      else
        # i am strupid
        BBDJJnnnndjjBBBBB = 33444
        format.html { render :edit }
        format.json { render json: @employment_services_premium_employment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_services/premium_employment_services/1
  # DELETE /employment_services/premium_employment_services/1.json
  def destroy
    @employment_services_premium_employment_service.destroy
    respond_to do |format|
      format.html { redirect_to employment_services_premium_employment_services_url, notice: 'Premium employment service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_services_premium_employment_service
      @employment_services_premium_employment_service = EmploymentServices::PremiumEmploymentService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_services_premium_employment_service_params
      params.fetch(:employment_services_premium_employment_service, {})
    end
end
