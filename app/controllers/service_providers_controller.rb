class ServiceProvidersController < ApplicationController

  before_filter :service_provider_only, except: [:index, :show] #this method service_provider_only declared in app_contlr
  before_action :set_service_provider, only: [:show, :edit, :update, :destroy]


  # GET /service_providers
  # GET /service_providers.json
  def index

    if current_user
        @service_providers = ServiceProvider.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 1)
        # return
    end

    # @filter = {}

    # if params[:lowest_price].blank? || params[:highest_price].blank? || params[:location].blank?
    #   @search = ServiceProvider.includes(:prices).references(:prices).search do
    #               fulltext params[:search]
    #               with(:created_at).less_than Time.now
    #               order_by :updated_at, :desc
    #               paginate :page => params[:page] || 1, :per_page => 15
    #             end
    #   @service_providers = @search.results
    # else
    #   @service_providers = ServiceProvider.includes(:prices).references(:prices).where('prices.price >= ?', params[:lowest_price].to_i) unless params[:lowest_price].blank?
    #   @service_providers = @service_providers.where('prices.price <= ?', params[:highest_price].to_i) unless params[:highest_price].blank? || @service_providers.blank?
    #   @service_providers = ServiceProvider.includes(:prices).references(:prices).where('prices.price <= ?', params[:highest_price].to_i) unless params[:highest_price].blank? || !@service_providers.blank?
    
    #   @service_providers = @service_providers.near(params[:location], 10, :units => :km) unless params[:location].blank? || @service_providers.blank?
    #   @service_providers = ServiceProvider.near(params[:location], 10, :units => :km) unless params[:location].blank? || !@service_providers.blank?
      
    #   @search = @service_providers.search do
    #               fulltext params[:search]
    #               with(:created_at).less_than Time.now
    #               order_by :updated_at, :desc
    #               paginate :page => params[:page] || 1, :per_page => 15
    #             end
    #   @service_providers = @search.results
    # end
    
    # @filter[:search] = params[:search]

    

  end

  # GET /service_providers/1
  # GET /service_providers/1.json
  def show
    @cart = Cart.new
    @rate_avg = Rate.where(rateable_id: 1, rateable_type: "ServiceProvider").average(:stars).to_f.round
    @comment = Comment.new
    @comments = @service_provider.comments
  end

  # GET /service_providers/new
  def new
    @service_provider = ServiceProvider.new
    @service_provider.build_address
    @service_provider.skills.build
    # @service_provider.service_providers_skills.build
    @domains = Domain.where.not(parent_id: 0)
  end

  # GET /service_providers/1/edit
  def edit
  end

  # POST /service_providers
  # POST /service_providers.json
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
    binding.pry
    respond_to do |format|
      if @service_provider.save
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_providers/1
  # PATCH/PUT /service_providers/1.json
  def update
    respond_to do |format|
      if @service_provider.update(service_provider_params)
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully updated.' }
         format.json { respond_with_bip(@service_provider) }
        # format.json { render :edit, status: :ok, location: @service_provider, notice: 'Service provider was successfully updated.' }
      else
        format.html { render :edit }
        # format.json { render json: @service_provider.errors, status: :unprocessable_entity }
         format.json { respond_with_bip(@service_provider) }
      end
    end
  end

  # DELETE /service_providers/1
  # DELETE /service_providers/1.json
  def destroy
    @service_provider.destroy
    respond_to do |format|
      format.html { redirect_to service_providers_url, notice: 'Service provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_provider
      @service_provider = ServiceProvider.includes(:prices, :comments).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_provider_params
      # binding.pry
      params[:service_provider][:address_attributes] = Address.save_address_details(params[:service_provider][:address_attributes], current_user.id)
      params[:service_provider][:user_id] = current_user.id
      params[:service_provider].permit!
    end
end
