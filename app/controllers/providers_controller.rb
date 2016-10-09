class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :provider_only, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :sanitize_params, only: [:create, :update]
  before_action :sanitize_feedback_params, only: [:feedback]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @rate_avg = Rate.where(rateable_id: 1, rateable_type: "Provider").average(:stars).to_f.round
    @feedbacks = @provider.feedbacks
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @categories = Category.all
    @provider.build_address
    if current_user.provider.present?
      redirect_to edit_provider_path(current_user.provider)
    end
  end

  # GET /providers/1/edit
  def edit
  end

  def feedback
    @feedback = Feedback.new(feedback_params)
    if @feedback.save!
      format.html { redirect_to :back, notice: 'Feedback was successfully Submitted.' }
    else
      format.html { redirect_to :back, error: 'Something Went Wrong! Try Again After Sometime' }
    end
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    @provider.build_address(params[:provider][:address_attributes])
    respond_to do |format|
      if @provider.save
        if !params[:provider][:skill_ids].blank?
          Skill.where(id: params[:provider][:skill_ids]).each do |skill|
            @provider.skills << skill
          end
        end
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end
    def sanitize_params
      params[:provider][:user_id] = current_user.id
      params[:provider][:address_attributes][:user_id] = current_user.id
      params[:provider][:skill_ids] = params[:provider][:skill_ids].reject(&:empty?)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      # params[:provider][:user_id] = current_user.id
      params[:provider].permit!
      # params.fetch(:provider, {}).permit(:title, :description, :notice_period, :category_id, :work_time_preference, :work_day_preference, :portfolio_website)
    end
    def feedback_params
      params.require(:feedback_attr).permit!
    end
    def sanitize_feedback_params
       params[:feedback_attr] = {}
       params[:feedback_attr][:provider_id] = params[:provider_id].to_i
       params[:feedback_attr][:description] = params[:description]
       params[:feedback_attr][:user_id] = current_user.id
    end
end
