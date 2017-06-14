class ScheduledServices::OfficeAppointmentsController < ApplicationController
  before_action :set_scheduled_services_office_appointment, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_services/office_appointments
  # GET /scheduled_services/office_appointments.json
  def index
    @scheduled_services_office_appointments = ScheduledServices::OfficeAppointment.all
  end

  # GET /scheduled_services/office_appointments/1
  # GET /scheduled_services/office_appointments/1.json
  def show
  end

  # GET /scheduled_services/office_appointments/new
  def new
    @scheduled_services_office_appointment = ScheduledServices::OfficeAppointment.new
  end

  # GET /scheduled_services/office_appointments/1/edit
  def edit
  end

  # POST /scheduled_services/office_appointments
  # POST /scheduled_services/office_appointments.json
  def create
    @scheduled_services_office_appointment = ScheduledServices::OfficeAppointment.new(scheduled_services_office_appointment_params)

    respond_to do |format|
      if @scheduled_services_office_appointment.save
        format.html { redirect_to @scheduled_services_office_appointment, notice: 'Office appointment was successfully created.' }
        format.json { render :show, status: :created, location: @scheduled_services_office_appointment }
      else
        format.html { render :new }
        format.json { render json: @scheduled_services_office_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_services/office_appointments/1
  # PATCH/PUT /scheduled_services/office_appointments/1.json
  def update
    respond_to do |format|
      if @scheduled_services_office_appointment.update(scheduled_services_office_appointment_params)
        format.html { redirect_to @scheduled_services_office_appointment, notice: 'Office appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduled_services_office_appointment }
      else
        format.html { render :edit }
        format.json { render json: @scheduled_services_office_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_services/office_appointments/1
  # DELETE /scheduled_services/office_appointments/1.json
  def destroy
    @scheduled_services_office_appointment.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_services_office_appointments_url, notice: 'Office appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_services_office_appointment
      @scheduled_services_office_appointment = ScheduledServices::OfficeAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_services_office_appointment_params
      params.fetch(:scheduled_services_office_appointment, {})
    end
end
