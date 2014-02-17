class ProcessingUnitsController < ApplicationController
  before_action :set_processing_unit, only: [:show, :edit, :update, :destroy]

  # GET /processing_units
  # GET /processing_units.json
  def index
    @processing_units = ProcessingUnit.all
  end

  # GET /processing_units/1
  # GET /processing_units/1.json
  def show
  end

  # GET /processing_units/new
  def new
    @processing_unit = ProcessingUnit.new
  end

  # GET /processing_units/1/edit
  def edit
  end

  # POST /processing_units
  # POST /processing_units.json
  def create
    @processing_unit = ProcessingUnit.new(processing_unit_params)
    # @processing_unit.user_id = current_user.id

    respond_to do |format|
      if @processing_unit.save
        format.html { redirect_to @processing_unit, notice: 'Processing unit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @processing_unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @processing_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processing_units/1
  # PATCH/PUT /processing_units/1.json
  def update
    respond_to do |format|
      if @processing_unit.update(processing_unit_params)
        format.html { redirect_to @processing_unit, notice: 'Processing unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @processing_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processing_units/1
  # DELETE /processing_units/1.json
  def destroy
    @processing_unit.destroy
    respond_to do |format|
      format.html { redirect_to processing_units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing_unit
      @processing_unit = ProcessingUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processing_unit_params
      params.require(:processing_unit).permit(:latitude, :longitude, :address, :user_id)
    end
end
