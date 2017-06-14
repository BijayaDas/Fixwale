class ConnectingServices::EnquiriesController < ApplicationController
  before_action :set_connecting_services_enquiry, only: [:show, :edit, :update, :destroy]

  # GET /connecting_services/enquiries
  # GET /connecting_services/enquiries.json
  def index
    @connecting_services_enquiries = ConnectingServices::Enquiry.all
  end

  # GET /connecting_services/enquiries/1
  # GET /connecting_services/enquiries/1.json
  def show
  end

  # GET /connecting_services/enquiries/new
  def new
    @connecting_services_enquiry = ConnectingServices::Enquiry.new
  end

  # GET /connecting_services/enquiries/1/edit
  def edit
  end

  # POST /connecting_services/enquiries
  # POST /connecting_services/enquiries.json
  def create
    @connecting_services_enquiry = ConnectingServices::Enquiry.new(connecting_services_enquiry_params)

    respond_to do |format|
      if @connecting_services_enquiry.save
        format.html { redirect_to @connecting_services_enquiry, notice: 'Enquiry was successfully created.' }
        format.json { render :show, status: :created, location: @connecting_services_enquiry }
      else
        format.html { render :new }
        format.json { render json: @connecting_services_enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connecting_services/enquiries/1
  # PATCH/PUT /connecting_services/enquiries/1.json
  def update
    respond_to do |format|
      if @connecting_services_enquiry.update(connecting_services_enquiry_params)
        format.html { redirect_to @connecting_services_enquiry, notice: 'Enquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @connecting_services_enquiry }
      else
        format.html { render :edit }
        format.json { render json: @connecting_services_enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connecting_services/enquiries/1
  # DELETE /connecting_services/enquiries/1.json
  def destroy
    @connecting_services_enquiry.destroy
    respond_to do |format|
      format.html { redirect_to connecting_services_enquiries_url, notice: 'Enquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connecting_services_enquiry
      @connecting_services_enquiry = ConnectingServices::Enquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connecting_services_enquiry_params
      params.fetch(:connecting_services_enquiry, {})
    end
end
