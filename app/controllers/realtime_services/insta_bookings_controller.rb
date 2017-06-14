class RealtimeServices::InstaBookingsController < ApplicationController
  before_action :set_realtime_services_insta_booking, only: [:show, :edit, :update, :destroy]

  # GET /realtime_services/insta_bookings
  # GET /realtime_services/insta_bookings.json
  def index
    @realtime_services_insta_bookings = RealtimeServices::InstaBooking.all
  end

  # GET /realtime_services/insta_bookings/1
  # GET /realtime_services/insta_bookings/1.json
  def show
  end

  # GET /realtime_services/insta_bookings/new
  def new
    @realtime_services_insta_booking = RealtimeServices::InstaBooking.new
  end

  # GET /realtime_services/insta_bookings/1/edit
  def edit
  end

  # POST /realtime_services/insta_bookings
  # POST /realtime_services/insta_bookings.json
  def create
    @realtime_services_insta_booking = RealtimeServices::InstaBooking.new(realtime_services_insta_booking_params)

    respond_to do |format|
      if @realtime_services_insta_booking.save
        format.html { redirect_to @realtime_services_insta_booking, notice: 'Insta booking was successfully created.' }
        format.json { render :show, status: :created, location: @realtime_services_insta_booking }
      else
        format.html { render :new }
        format.json { render json: @realtime_services_insta_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realtime_services/insta_bookings/1
  # PATCH/PUT /realtime_services/insta_bookings/1.json
  def update
    respond_to do |format|
      if @realtime_services_insta_booking.update(realtime_services_insta_booking_params)
        format.html { redirect_to @realtime_services_insta_booking, notice: 'Insta booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @realtime_services_insta_booking }
      else
        format.html { render :edit }
        format.json { render json: @realtime_services_insta_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realtime_services/insta_bookings/1
  # DELETE /realtime_services/insta_bookings/1.json
  def destroy
    @realtime_services_insta_booking.destroy
    respond_to do |format|
      format.html { redirect_to realtime_services_insta_bookings_url, notice: 'Insta booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtime_services_insta_booking
      @realtime_services_insta_booking = RealtimeServices::InstaBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realtime_services_insta_booking_params
      params.fetch(:realtime_services_insta_booking, {})
    end
end
