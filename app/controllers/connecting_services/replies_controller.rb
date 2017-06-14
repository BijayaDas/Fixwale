class ConnectingServices::RepliesController < ApplicationController
  before_action :set_connecting_services_reply, only: [:show, :edit, :update, :destroy]

  # GET /connecting_services/replies
  # GET /connecting_services/replies.json
  def index
    @connecting_services_replies = ConnectingServices::Reply.all
  end

  # GET /connecting_services/replies/1
  # GET /connecting_services/replies/1.json
  def show
  end

  # GET /connecting_services/replies/new
  def new
    @connecting_services_reply = ConnectingServices::Reply.new
  end

  # GET /connecting_services/replies/1/edit
  def edit
  end

  # POST /connecting_services/replies
  # POST /connecting_services/replies.json
  def create
    @connecting_services_reply = ConnectingServices::Reply.new(connecting_services_reply_params)

    respond_to do |format|
      if @connecting_services_reply.save
        format.html { redirect_to @connecting_services_reply, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @connecting_services_reply }
      else
        format.html { render :new }
        format.json { render json: @connecting_services_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connecting_services/replies/1
  # PATCH/PUT /connecting_services/replies/1.json
  def update
    respond_to do |format|
      if @connecting_services_reply.update(connecting_services_reply_params)
        format.html { redirect_to @connecting_services_reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @connecting_services_reply }
      else
        format.html { render :edit }
        format.json { render json: @connecting_services_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connecting_services/replies/1
  # DELETE /connecting_services/replies/1.json
  def destroy
    @connecting_services_reply.destroy
    respond_to do |format|
      format.html { redirect_to connecting_services_replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connecting_services_reply
      @connecting_services_reply = ConnectingServices::Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connecting_services_reply_params
      params.fetch(:connecting_services_reply, {})
    end
end
