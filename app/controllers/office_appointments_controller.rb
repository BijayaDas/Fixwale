class OfficeAppointmentsController < ApplicationController
  before_action :set_office_appointment, only: [:show, :edit, :update, :destroy]

  # GET /office_appointments
  # GET /office_appointments.json
  def index
    @office_appointments = OfficeAppointment.all
  end

  # GET /office_appointments/1
  # GET /office_appointments/1.json
  def show
  end

  # GET /office_appointments/new
  def new
    @office_appointment = OfficeAppointment.new
  end

  # GET /office_appointments/1/edit
  def edit
  end

  # POST /office_appointments
  # POST /office_appointments.json
  def create
    @office_appointment = OfficeAppointment.new(office_appointment_params)

    respond_to do |format|
      if @office_appointment.save
        format.html { redirect_to @office_appointment, notice: 'Office appointment was successfully created.' }
        format.json { render :show, status: :created, location: @office_appointment }
      else
        format.html { render :new }
        format.json { render json: @office_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_appointments/1
  # PATCH/PUT /office_appointments/1.json
  def update
    respond_to do |format|
      if @office_appointment.update(office_appointment_params)
        format.html { redirect_to @office_appointment, notice: 'Office appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_appointment }
      else
        format.html { render :edit }
        format.json { render json: @office_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_appointments/1
  # DELETE /office_appointments/1.json
  def destroy
    @office_appointment.destroy
    respond_to do |format|
      format.html { redirect_to office_appointments_url, notice: 'Office appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_appointment
      @office_appointment = OfficeAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_appointment_params
      params.require(:office_appointment).permit(:description, :date, :time, :hours, :payment_due, :active)
    end
end
