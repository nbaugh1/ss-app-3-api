class RfIsController < ApplicationController
  before_action :set_rfi, only: [:show, :update, :destroy]

  # GET /rfis
  def index
    @rfis = Rfi.all

    render json: @rfis
  end

  # GET /rfis/1
  def show
    render json: @rfi
  end

  # POST /rfis
  def create
    @rfi = Rfi.new(rfi_params)

    if @rfi.save
      render json: @rfi, status: :created, location: @rfi
    else
      render json: @rfi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rfis/1
  def update
    if @rfi.update(rfi_params)
      render json: @rfi
    else
      render json: @rfi.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rfis/1
  def destroy
    @rfi.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfi
      @rfi = Rfi.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rfi_params
      params.require(:rfi).permit(:request_id, :requested_from, :nickname, :description, :suggestion, :primary_discipline, :is_urgent, :pm_contact, :status)
    end
end
