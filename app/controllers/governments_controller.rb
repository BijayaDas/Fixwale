class GovernmentsController < ApplicationController
  before_action :set_government, only: [:show, :edit, :update, :destroy]

  # GET /governments
  # GET /governments.json
  def index
    @governments = Government.all
  end

  # GET /governments/1
  # GET /governments/1.json
  def show
  end

  # GET /governments/new
  def new
    @government = Government.new
  end

  # GET /governments/1/edit
  def edit
  end

  # POST /governments
  # POST /governments.json
  def create
    @government = Government.new(government_params)

    respond_to do |format|
      if @government.save
        format.html { redirect_to @government, notice: 'Government was successfully created.' }
        format.json { render :show, status: :created, location: @government }
      else
        format.html { render :new }
        format.json { render json: @government.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /governments/1
  # PATCH/PUT /governments/1.json
  def update
    respond_to do |format|
      if @government.update(government_params)
        format.html { redirect_to @government, notice: 'Government was successfully updated.' }
        format.json { render :show, status: :ok, location: @government }
      else
        format.html { render :edit }
        format.json { render json: @government.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /governments/1
  # DELETE /governments/1.json
  def destroy
    @government.destroy
    respond_to do |format|
      format.html { redirect_to governments_url, notice: 'Government was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government
      @government = Government.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def government_params
      params.fetch(:government, {})
    end
end
