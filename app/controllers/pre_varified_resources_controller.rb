class PreVarifiedResourcesController < ApplicationController
  before_action :set_pre_varified_resource, only: [:show, :edit, :update, :destroy]

  # GET /pre_varified_resources
  # GET /pre_varified_resources.json
  def index
    @pre_varified_resources = PreVarifiedResource.all
  end

  # GET /pre_varified_resources/1
  # GET /pre_varified_resources/1.json
  def show
  end

  # GET /pre_varified_resources/new
  def new
    @pre_varified_resource = PreVarifiedResource.new
  end

  # GET /pre_varified_resources/1/edit
  def edit
  end

  # POST /pre_varified_resources
  # POST /pre_varified_resources.json
  def create
    @pre_varified_resource = PreVarifiedResource.new(pre_varified_resource_params)

    respond_to do |format|
      if @pre_varified_resource.save
        format.html { redirect_to @pre_varified_resource, notice: 'Pre varified resource was successfully created.' }
        format.json { render :show, status: :created, location: @pre_varified_resource }
      else
        format.html { render :new }
        format.json { render json: @pre_varified_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_varified_resources/1
  # PATCH/PUT /pre_varified_resources/1.json
  def update
    respond_to do |format|
      if @pre_varified_resource.update(pre_varified_resource_params)
        format.html { redirect_to @pre_varified_resource, notice: 'Pre varified resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_varified_resource }
      else
        format.html { render :edit }
        format.json { render json: @pre_varified_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_varified_resources/1
  # DELETE /pre_varified_resources/1.json
  def destroy
    @pre_varified_resource.destroy
    respond_to do |format|
      format.html { redirect_to pre_varified_resources_url, notice: 'Pre varified resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_varified_resource
      @pre_varified_resource = PreVarifiedResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_varified_resource_params
      params.require(:pre_varified_resource).permit(:expert_level, :skill_sets, :years_experience, :designation, :budget, :need_before)
    end
end
