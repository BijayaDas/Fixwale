class DomainsController < ApplicationController
  before_filter :admin_only, except: [:show] #this method admin_only declared in app_contlr

  before_action :set_domain, only: [:show]

  # GET /domains
  # GET /domains.json
  def index
    # @domains = Domain.all
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @service_providers = ServiceProvider.includes(:prices).where(domain_id: @domain.id).references(:prices).uniq

    @service_providers = @service_providers.where('prices.price >= ?', params[:lowest_price].to_i) unless params[:lowest_price].blank? || @service_providers.blank?
    @service_providers = @service_providers.where('prices.price <= ?', params[:highest_price].to_i) unless params[:highest_price].blank? || @service_providers.blank?
    
    @service_providers = @service_providers.near(params[:location], 10, :units => :km) unless params[:location].blank? || @service_providers.blank?
    @service_providers = @service_providers.paginate(:page => params[:page], :per_page => 20) unless @service_providers.blank?

  end

  # GET /domains/new
  def new
    # @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    # @domain = Domain.new(domain_params)

    # respond_to do |format|
    #   if @domain.save
    #     format.html { redirect_to @domain, notice: 'Domain was successfully created.' }
    #     format.json { render :show, status: :created, location: @domain }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @domain.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    # respond_to do |format|
    #   if @domain.update(domain_params)
    #     format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @domain }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @domain.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    # @domain.destroy
    # respond_to do |format|
    #   format.html { redirect_to domains_url, notice: 'Domain was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      # params[:domain]
    end
end
