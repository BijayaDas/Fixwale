class InstaBookingsController < ApplicationController
  before_action :set_insta_booking, only: [:show, :edit, :update, :destroy]

  # GET /insta_bookings
  # GET /insta_bookings.json
  def index
    @insta_bookings = InstaBooking.all
  end

  # GET /insta_bookings/1
  # GET /insta_bookings/1.json
  def show
  end

  # GET /insta_bookings/new
  def new
    @insta_booking = InstaBooking.new
  end

  # GET /insta_bookings/1/edit
  def edit
  end

  # POST /insta_bookings
  # POST /insta_bookings.json
  def create
    @insta_booking = InstaBooking.new(insta_booking_params)

    respond_to do |format|
      if @insta_booking.save
        format.html { redirect_to @insta_booking, notice: 'Insta booking was successfully created.' }
        format.json { render :show, status: :created, location: @insta_booking }
      else
        format.html { render :new }
        format.json { render json: @insta_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insta_bookings/1
  # PATCH/PUT /insta_bookings/1.json
  def update
    respond_to do |format|
      if @insta_booking.update(insta_booking_params)
        format.html { redirect_to @insta_booking, notice: 'Insta booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @insta_booking }
      else
        format.html { render :edit }
        format.json { render json: @insta_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insta_bookings/1
  # DELETE /insta_bookings/1.json
  def destroy
    @insta_booking.destroy
    respond_to do |format|
      format.html { redirect_to insta_bookings_url, notice: 'Insta booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insta_booking
      @insta_booking = InstaBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insta_booking_params
      params.require(:insta_booking).permit(:user_id, :category_id, :description, :date, :time, :hours, :payment_due, :active)
    end
end
