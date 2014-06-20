class LocationGranularitiesController < ApplicationController
  before_action :set_location_granularity, only: [:show, :edit, :update, :destroy]

  # GET /location_granularities
  # GET /location_granularities.json
  def index
    @location_granularities = LocationGranularity.all
  end

  # GET /location_granularities/1
  # GET /location_granularities/1.json
  def show
  end

  # GET /location_granularities/new
  def new
    @location_granularity = LocationGranularity.new
  end

  # GET /location_granularities/1/edit
  def edit
  end

  # POST /location_granularities
  # POST /location_granularities.json
  def create
    @location_granularity = LocationGranularity.new(location_granularity_params)
    @location_granularity.user_id = current_user.id

    respond_to do |format|
      if @location_granularity.save
        format.html { redirect_to @location_granularity, notice: 'Location granularity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location_granularity }
      else
        format.html { render action: 'new' }
        format.json { render json: @location_granularity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_granularities/1
  # PATCH/PUT /location_granularities/1.json
  def update
    @location_granularity.user_id = current_user.id
    
    respond_to do |format|
      if @location_granularity.update(location_granularity_params)
        format.html { redirect_to @location_granularity, notice: 'Location granularity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location_granularity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_granularities/1
  # DELETE /location_granularities/1.json
  def destroy
    @location_granularity.destroy
    respond_to do |format|
      format.html { redirect_to location_granularities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_granularity
      @location_granularity = LocationGranularity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_granularity_params
      params.require(:location_granularity).permit(:user_id, :description)
    end
end
