class FullTimeEmploymentsController < ApplicationController
  before_action :set_full_time_employment, only: [:show, :edit, :update, :destroy]

  # GET /full_time_employments
  # GET /full_time_employments.json
  def index
    @full_time_employments = FullTimeEmployment.all
  end

  # GET /full_time_employments/1
  # GET /full_time_employments/1.json
  def show
  end

  # GET /full_time_employments/new
  def new
    @full_time_employment = FullTimeEmployment.new
  end

  # GET /full_time_employments/1/edit
  def edit
  end

  # POST /full_time_employments
  # POST /full_time_employments.json
  def create
    @full_time_employment = FullTimeEmployment.new(full_time_employment_params)

    respond_to do |format|
      if @full_time_employment.save
        format.html { redirect_to @full_time_employment, notice: 'Full time employment was successfully created.' }
        format.json { render :show, status: :created, location: @full_time_employment }
      else
        format.html { render :new }
        format.json { render json: @full_time_employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_time_employments/1
  # PATCH/PUT /full_time_employments/1.json
  def update
    respond_to do |format|
      if @full_time_employment.update(full_time_employment_params)
        format.html { redirect_to @full_time_employment, notice: 'Full time employment was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_time_employment }
      else
        format.html { render :edit }
        format.json { render json: @full_time_employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_time_employments/1
  # DELETE /full_time_employments/1.json
  def destroy
    @full_time_employment.destroy
    respond_to do |format|
      format.html { redirect_to full_time_employments_url, notice: 'Full time employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_time_employment
      @full_time_employment = FullTimeEmployment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_time_employment_params
      params.fetch(:full_time_employment, {})
    end
end
