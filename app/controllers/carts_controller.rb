class CartsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_filter :sanitize_parameters, only: [:create, :update]

  # GET /carts
  # GET /carts.json
  def index
    @carts = current_user.carts
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    if params['price_type'].to_i != 2
      total_amt = ServiceProvider.find(params[:cart]['service_provider_id'].to_i).prices.where(price_type: params['price_type'].to_i).first.amount 
    else
      total_amt = ServiceProvider.find(params[:cart]['service_provider_id'].to_i).prices.where(price_type: params['price_type'].to_i).first.amount * params[:cart]['hours'].to_i
    end
    @cart.total_amount = total_amt
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_path, notice: 'Shortlisted successfully.' }
        format.json { render :show, status: :created, location: @cart }
      else
        # format.html { render :new }
        redirect_to :back, flash[:error] => 'We were not able to add booking, please try again or call us!'
        # format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    # respond_to do |format|
    #   if @cart.update(cart_params)
    #     format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @cart }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart].permit!
    end

    def sanitize_parameters
      if !params[:cart].blank?
          params[:cart]['reporting_time'] = params[:cart]['reporting_time'].to_i if params['reporting_time'] != "flexible"
          params[:cart]['user_id'] = current_user.id 
          params[:cart]['description'] = params['description'] if params['hours'].present?
          params[:cart]['hours'] = params['hours'].to_i if params['hours'].present?
          # ServiceProvider.first.prices.where(price_type: 1).first.amount
          # binding.pry
          # params[:cart]['total_amount'] = params['price_type'].to_i if params['price_type'].present?
          params[:cart]['start_date'] = Date.parse(params[:cart]['start_date']).to_s
      end
    end
end
