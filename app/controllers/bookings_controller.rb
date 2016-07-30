class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :cancel]
  before_filter :sanitize_params, only: [:create, :update]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @carts = current_user.carts
    if @carts.blank?
      return redirect_to homes_path,:alert => "Nothing is in your Booking cart, please add first"
    end
  end

  # GET /bookings/1/edit
  def edit
    # binding.pry
    # raise "success is near".inspect
    if @booking.address_id.present?
      redirect_to action: "show", id: @booking.id
    
    elsif params[:booking].present?
      add = Address.save_address_details(params[:booking][:addresses], current_user)
      address = Address.create(add)
      @booking.update_attributes(address_id: address.id)
      redirect_to action: "show", id: @booking.id
      # render :edit
    end
    # @saved_address = @booking.address
    # @address = Address.new
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # @booking = Booking.new(booking_params)
    if params[:booking][:addresses].present?
      add = Address.save_address_details(params[:booking][:addresses], current_user.id)
      # params[:booking][:addresses][:user_id] = current_user.id
      if add
        address = Address.create(add)
        @carts = current_user.carts
        @carts.each do |cart|
          cart_param = cart.attributes
          cart_param[:address_id] = address.id
          ["id", "created_at", "updated_at"].each { |x| cart_param.delete(x) }
          unless Booking.create(cart_param)
            address.delete
            return redirect_to bookings_path,:alert => "Bookings was Unsuccessful, Please Try again after some time"
          end
          cart.delete
        end
        redirect_to bookings_path, :alert => "Bookings Placed Successfuly"
      else
        redirect_to bookings_path, :alert => "Bookings Placed Unsuccessful Because Pincode you provided is wrong"
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update  #only for SP
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy #only for SP
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel  #only for rc
    respond_to do |format|
      if @booking && @booking.status == "booked"
        @booking.update_attributes(status: "cancelled")
        format.html { redirect_to @booking, notice: 'Booking was Cancelled.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { redirect_to :back, notice: 'Something Went Wrong.' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      if @booking = current_user.bookings.find_by(params[:id])

      elsif current_user.role == "service_provider"
        @booking = Booking.find_by(params[:id])
        unless current_user.service_providers.ids.include? @booking.service_provider_id
          @booking = nil
        end
        
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      # params.require(:booking).permit!
      params[:booking].permit!
      # params[:booking][:addresses].permit(:street1, :street2, :mobile, :pincode)
      # params.require(:booking).permit!(Booking.address.keys)
    end

    def sanitize_params
      if !params[:booking].blank?
          # params[:booking]['reporting_time'] = params[:booking]['reporting_time(4i)']
          params[:booking]['user_id'] = current_user.id rescue 0
      end
    end
end
