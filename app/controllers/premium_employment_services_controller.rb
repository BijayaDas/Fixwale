class PremiumEmploymentServicesController < ApplicationController
  before_action :set_premium_employment_service, only: [:show, :edit, :update, :destroy]

  # GET /premium_employment_services
  # GET /premium_employment_services.json
  def index
    @premium_employment_services = PremiumEmploymentService.all
  end

  # GET /premium_employment_services/1
  # GET /premium_employment_services/1.json
  def show
  end

  # GET /premium_employment_services/new
  def new
    @premium_employment_service = PremiumEmploymentService.new
  end

  # GET /premium_employment_services/1/edit
  def edit
  end

  # POST /premium_employment_services
  # POST /premium_employment_services.json
  def create
    @premium_employment_service = PremiumEmploymentService.new(premium_employment_service_params)

    respond_to do |format|
      if @premium_employment_service.save
        format.html { redirect_to @premium_employment_service, notice: 'Premium employment service was successfully created.' }
        format.json { render :show, status: :created, location: @premium_employment_service }
      else
        format.html { render :new }
        format.json { render json: @premium_employment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premium_employment_services/1
  # PATCH/PUT /premium_employment_services/1.json
  def update
    respond_to do |format|
      if @premium_employment_service.update(premium_employment_service_params)
        format.html { redirect_to @premium_employment_service, notice: 'Premium employment service was successfully updated.' }
        format.json { render :show, status: :ok, location: @premium_employment_service }
      else
        format.html { render :edit }
        format.json { render json: @premium_employment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premium_employment_services/1
  # DELETE /premium_employment_services/1.json
  def destroy
    @premium_employment_service.destroy
    respond_to do |format|
      format.html { redirect_to premium_employment_services_url, notice: 'Premium employment service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium_employment_service
      @premium_employment_service = PremiumEmploymentService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_employment_service_params
      params.require(:premium_employment_service).permit(:attempts_limit, :current_attempt, :placed, :placed_in, :paid_ammount, :offered_ctc, :active)
    end
end
